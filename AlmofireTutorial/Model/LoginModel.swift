//
//  LoginModel.swift
//  AlmofireTutorial
//
//  Created by Omkar Choudhari on 23/2/21.
//

import Foundation

struct LoginModel: Encodable {
    let login: String
    let password: String
}

struct LoginResponseModel {
    let firstName: String
    let lastName: String
    let email: String
    

}
