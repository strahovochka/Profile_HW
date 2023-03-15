//
//  UserProfile.swift
//  Profile
//
//  Created by Яна Страшок on 10.01.2023.
//

import Foundation

enum Gender {
    case female
    case male
    
    var toString: String {
        switch self {
        case .female:
            return "Female"
        case .male:
            return "Male"
        }
    }
}

class UserProfile  {
    var name: String
    var nickName: String
    var email: String
    var phoneNumber: String
    var country: String
    var gender: Gender
    var address: String
    
    var isGeneralNotifications = true
    var isSound = true
    var isVibrate = false
    
    init(name: String, nickName: String, email: String, phoneNumber: String, country: String, gender: String, address: String, isGeneralNotifications: Bool, isSound: Bool, isVibrate: Bool) {
        self.name = name
        self.nickName = nickName
        self.email = email
        self.phoneNumber = phoneNumber
        self.country = country
        switch gender.lowercased() {
        case "female":
            self.gender = .female
        case "male":
            self.gender = .male
        default:
            self.gender = .female
        }
        self.address = address
        self.isGeneralNotifications = isGeneralNotifications
        self.isSound = isSound
        self.isVibrate = isVibrate
    }
}
