//
//  UserProfile.swift
//  TestThuDelegate
//
//  Created by Admin on 29/6/25.
//

import Foundation
import RealmSwift

class UserProfile:Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var firstName: String
    @Persisted var lastName: String
    var fullName: String{
        return "\(firstName) \(lastName)"
    }
    @Persisted var weight: Double
    @Persisted var height: Double
    func calculateBMI()->Double{
        return Double(String(format: "%.1f",(weight / (height * height / 100_00)))) ?? 0
    }
    @Persisted var gender: Gender
    convenience init(firstName: String, lastName: String, weight: Double, height: Double, gender: Gender) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
        self.weight = weight
        self.height = height
        self.gender = gender
    }
    func getGender() -> String {
        return gender.description
    }
}
enum Gender: String, PersistableEnum{
    case male
    case female
    var description: String {
        switch self {
            case .male: return "Male"
            case .female: return "Female"
        }
    }
}
extension Gender {
    init(description: String) {
        switch description {
        case Gender.male.description:
            self = .male
        case Gender.female.description:
            self = .female
        default:
            self = .male
        }
    }
}
