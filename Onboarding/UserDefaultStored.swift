//
//  UserDefaultStored.swift
//  Onboarding
//
//  Created by Thành Mai on 23/06/2023.
//

import Foundation


enum UserDefaultKey: String {
    case firstTimeOpen = "FIRST_TIME_OPEN"
    case isLogout = "IS_LOGOUT"
    case myProfile = "MY_PROFILE"
    case language = "LANGUAGE"
    case commonVersion = "COMMON_VERSION"
    case fcmToken = "FCM_TOKEN"
}

struct UserDefaultStored {
    static private let userDefaults = UserDefaults.standard
    
    static var firstTimeOpen: Bool {
        get {
            guard let value =  userDefaults.object(forKey: UserDefaultKey.firstTimeOpen.rawValue) as? Bool else {
                return true
            }
            
            return value
        }
        set {
            userDefaults.set(newValue, forKey: UserDefaultKey.firstTimeOpen.rawValue)
        }
    }
    
    static var profile: UserProfileModel? {
        get {
            if let savedPerson = userDefaults.object(forKey: UserDefaultKey.myProfile.rawValue) as? Data {
                let decoder = JSONDecoder()
                if let loadedPerson = try? decoder.decode(UserProfileModel.self, from: savedPerson) {
                    
                    return loadedPerson
                }
            }
            return nil
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                userDefaults.set(encoded, forKey: UserDefaultKey.myProfile.rawValue)
            }
        }
    }
    
    static func cleanData() {
        UserDefaultStored.profile = nil
    }
    
    static var language: String? {
        get {
            guard let value =  userDefaults.object(forKey: UserDefaultKey.language.rawValue) as? String else {
                let local = Locale.current.description
                
                return local.uppercased().contains("VI") ? "vi" : "en"
            }
            
            return value
        }
        
        set {
            userDefaults.set(newValue, forKey: UserDefaultKey.language.rawValue)
        }
    }
    
    static var commonVersion: String {
        get {
            guard let value =  userDefaults.object(forKey: UserDefaultKey.commonVersion.rawValue) as? String else {
                return "0.0.0"
            }
            
            return value
        }
        
        set {
            userDefaults.set(newValue, forKey: UserDefaultKey.commonVersion.rawValue)
        }
    }
    
    static var fcmToKen: String {
        get {
            guard let value =  userDefaults.object(forKey: UserDefaultKey.fcmToken.rawValue) as? String else {
                return ""
            }
            
            return value
        }
        
        set {
            userDefaults.set(newValue, forKey: UserDefaultKey.fcmToken.rawValue)
        }
    }
}
