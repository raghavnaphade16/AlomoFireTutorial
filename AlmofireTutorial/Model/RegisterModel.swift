//
//  RegisterModel.swift
//  AlmofireTutorial
//
//  Created by Omkar Choudhari on 22/2/21.
//

import Foundation

struct RegisterModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}

struct ResponseModel: Codable {
    let lastName: String
    let lastLogin: Int
    let userStatus: String
    let created: Int
    let ownerID, socialAccount, firstName, welcomeClass: String
    let blUserLocale, userToken: String
    //let updated: JSONNull?
    let objectID, email: String

    enum CodingKeys: String, CodingKey {
        case lastName, lastLogin, userStatus, created
        case ownerID = "ownerId"
        case socialAccount, firstName
        case welcomeClass = "___class"
        case blUserLocale
        case userToken = "user-token"
      //  case updated
        case objectID = "objectId"
        case email
    }
}

