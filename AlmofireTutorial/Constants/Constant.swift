//
//  Constant.swift
//  AlmofireTutorial
//
//  Created by Omkar Choudhari on 22/2/21.
//

import Foundation

let app_id = "037F9D4C-AE52-96F2-FFC5-119A8B7C1E00"
let rest_key = "0BC237CF-AAEF-418D-9C90-E447749E2E39"
let base_url = "https://api.backendless.com/\(app_id)/\(rest_key)/users/"
let register_url = "\(base_url)register"
let login_url = "\(base_url)login"
let logout_url = "\(base_url)logout"


struct TokenKey {
    static let userLogin = "USER_LOGIN_KEY"
}
