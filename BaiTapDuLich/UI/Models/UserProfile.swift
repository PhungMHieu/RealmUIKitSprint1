//
//  UserProfile.swift
//  TestThuDelegate
//
//  Created by Admin on 29/6/25.
//

import Foundation

class UserProfile {
    let id: String = UUID().uuidString
    var firstName: String
    var lastName: String
    var fullName: String{
        return "\(firstName) \(lastName)"
    }
    var weight: Double
    var height: Double
    func calculateBMI()->Double{
        return Double(String(format: "%.1f",(weight / (height * height / 100_00)))) ?? 0
    }
    var gender: Gender
    init(firstName: String, lastName: String, weight: Double, height: Double, gender: Gender) {
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
enum Gender: String{
    case male
    case female
//    case other
    var description: String {
        switch self {
            case .male: return "Male"
            case .female: return "Female"
//            case .other: return "Khác"
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
