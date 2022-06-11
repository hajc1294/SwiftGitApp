//
//  Defaults.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

///
///
///
class Defaults {
    
    ///
    ///
    ///
    static func isUserToken() -> Bool {
        return !(UserDefaults.standard.string(forKey: USER_TAG) ?? "").isEmpty
    }
    
    ///
    ///
    ///
    static func saveUserToken(user: String, token: String) {
        UserDefaults.standard.set(user, forKey: USER_TAG)
        KeychainHelper.standard.save(Data(token.utf8), service: SERVICE_TAG, account: user)
    }
    
    ///
    ///
    ///
    static func getUser() -> String {
        return UserDefaults.standard.string(forKey: USER_TAG) ?? ""
    }
    
    ///
    ///
    ///
    static func getToken() -> String {
        let data = KeychainHelper.standard.read(service: SERVICE_TAG, account: getUser()) ?? Data("".utf8)
        return String(data: data, encoding: .utf8)!
    }
    
    ///
    ///
    ///
    static func clear() {
        KeychainHelper.standard.delete(service: SERVICE_TAG, account: getUser())
        UserDefaults.standard.set("", forKey: USER_TAG)
    }
}
