//
//  User.swift
//  BaiTapDuLich
//
//  Created by Admin on 4/7/25.
//
import Foundation

final class User {
    var name: String
    var avatar: String
    
    init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}
extension User {
    static func getDummyDatas() -> [User] {
        var users: [User] = []
        
        for i in 1...4{
            let user = User(name: "User \(i)", avatar: "\(i%10)")
            users.append(user)
        }
        
        return users
    }
}
