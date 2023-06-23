//
//  String.swift
//  Onboarding
//
//  Created by Thành Mai on 23/06/2023.
//

import Foundation

extension String {
    func isNullOrEmpty() -> Bool {
        if self == "" || self == nil {
            return true
        }
        
        return false
    }
    
    func localition() -> String {
        let ns = NSLocalizedString(self, comment: self)
        let langCode = Bundle.main.preferredLocalizations[0]
        let usLocale = Locale(identifier: "en-US")
        var langName = ""
        if let languageName = usLocale.localizedString(forLanguageCode: langCode) {
            langName = languageName
        }
        if  let languageCode = UserDefaultStored.language,
            let path = Bundle.main.path(forResource: languageCode, ofType: "lproj"), let bundle = Bundle(path: path) {
            return NSLocalizedString(self, tableName: nil, bundle: bundle, comment: "")
        }
        return NSLocalizedString(self, comment: "")
    }
}
