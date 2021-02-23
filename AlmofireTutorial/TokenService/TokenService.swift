//
//  TokenService.swift
//  AlmofireTutorial
//
//  Created by Omkar Choudhari on 23/2/21.
//

import UIKit

class TokenService {
    static let tokenInstance = TokenService()
    let userDefault = UserDefaults.standard
    
    func saveToken(token: String){
        userDefault.set(token, forKey: TokenKey.userLogin)
    }
    func getToken() -> String{
        if let token = userDefault.object(forKey:   TokenKey.userLogin) as? String {
            return token
        }else{
            return ""
        }
    }
       
    func checkForlogin() -> Bool  {
        if getToken() == "" {
            return true
        }else{
            return false
        }
    }
    func removeToken() {
        userDefault.removeObject(forKey: TokenKey.userLogin)
    }
    
}
