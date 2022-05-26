//
//  UserViewModel.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation
import LocalAuthentication

///
///
///
class UserviewModel: ObservableObject {
    
    @Published var auth: Bool = false
    @Published var user: MUser = MUser()
    
    ///
    ///
    ///
    func authenticateWithFaceID() {
        
        var error: NSError?
        let laContext = LAContext()
        
        ///
        ///
        ///
        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Autentícate utilizando el sensor biométrico") { [weak self] authenticated, error in if let strongSelf = self {
                    if authenticated {
                        DispatchQueue.main.async { strongSelf.auth = true }
                    }
                } else {
                    return
                }
            }
        } else {
            self.auth = true
        }
    }
    
    ///
    ///
    ///
    func getUserInfo() {
        URLSession.shared.dataTask(with: Request.create(path: "\(USER_URL)\(Defaults.getUser())")) {(data, response, err) in
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        self.user = try JSONDecoder().decode(MUser.self, from: data)
                    } catch { return }
                }
            } else {
                print("Response: \(response.statusCode)")
            }
        }.resume()
    }
    
    ///
    ///
    ///
    func saveSession(user: String, token: String) {
        if (!user.isEmpty && !token.isEmpty) {
            Defaults.saveUserToken(user: user, token: token)
            self.auth = true
        }
    }
}
