//
//  RealmManager.swift
//  BaiTapDuLich
//
//  Created by iKame Elite Fresher 2025 on 12/8/25.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    private var realm: Realm
    
    private init() {
        do {
            realm = try Realm()
        } catch let error as NSError {
            fatalError("error creating Realm: \(error)")
        }
    }
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
}
