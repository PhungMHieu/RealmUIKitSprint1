//
//  RealmManager.swift
//  BaiTapDuLich
//
//  Created by iKame Elite Fresher 2025 on 12/8/25.
//

import Foundation
import RealmSwift
import Combine

class RealmManager {
    private static let mainInstance = RealmManager()
    static var shared: RealmManager{
        if Thread.isMainThread {
            return mainInstance
        } else {
            return RealmManager()
        }
    }
    private var realm: Realm
    private var notificationTokens:[String:NotificationToken] = [:]
    private var publishers: [String:Any] = [:]
    
    private init() {
        do {
            realm = try Realm()
            if let path = realm.configuration.fileURL?.path {
                print("Realm file path: \(path)")
            } else {
                print( "Realm file path not found")
            }
        } catch let error as NSError {
            fatalError("Lỗi tạo Realm: \(error)")
        }
    }
    
    func observeđDetails<T:Object>(_ type: T.Type) -> AnyPublisher<RealmCollectionChange<Results<T >>, Never> {
        let subject = PassthroughSubject<RealmCollectionChange<Results<T>>, Never>()
        let results = realm.objects(type)
//        let results = realm.objects(type).changesetPublisher
        let token = results.observe { changes in
            subject.send(changes)
        }
        notificationTokens[String(describing: type)] = token
        return subject.eraseToAnyPublisher()
    }
}

//crud
extension RealmManager {
    func save <T: Object> (object: T) {
        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
        } catch {
            print("Lỗi khi lưu đối tượng")
        }
    }
    func add <T: Object> (object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print("Lỗi khi thêm đối tượng")
        }
    }
    func delete <T: Object> (byPrimaryKey key:Any,ofType type: T.Type) {
        do {
            try realm.write {
                if let object = realm.object(ofType: type, forPrimaryKey: key){
                    realm.delete(object)
                } else {
                    print("Không tìm thấy đối tượng")
                }
            }
        } catch {
            print("Không xoá được object")
        }
    }
    func fetch<T:Object> (_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    func update<T:Object> (_ object: T, byPrimaryKey key:Any, ofType type: T.Type) {
        do {
            try realm.write {
                if let objectAdd = realm.object(ofType: type, forPrimaryKey: key){
//                    objectAdd.objectSchema.primaryKeyProperty
                    realm.add(object)
                } else {
                    print("Không tìm thấy đối tượng")
                }
            }
        } catch {
            print("Lỗi khi update object: \(error)")
        }
    }
}

// observe style lag
extension RealmManager {
    func observe<T:Object>(_ type: T.Type) -> AnyPublisher<[T], Never> {
        let key = String(describing: type)
        if let publisher = publishers[key] as? CurrentValueSubject<[T], Never> {
            return publisher.eraseToAnyPublisher()
        }
        let subject = CurrentValueSubject<[T], Never>([])
        publishers[key] = subject
        
        let results = realm.objects(type)
        subject.send(Array(results))
        
        let token = results.observe { changes in
            switch changes {
            case .initial(let collectionType):
                subject.send(Array(collectionType))
            case .update(let collectionType, let deletions, let insertions, let modifications):
                subject.send(Array(collectionType))
            case .error(let error):
                print("Lỗi khi quan sát realm: \(error)")
            }
        }
        notificationTokens[key] = token
        return subject.eraseToAnyPublisher()
    }
}
