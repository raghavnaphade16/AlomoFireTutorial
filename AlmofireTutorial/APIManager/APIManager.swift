//
//  APIManager.swift
//  AlmofireTutorial
//
//  Created by Omkar Choudhari on 22/2/21.
//

import Foundation
import Alamofire

enum APIErrors: Error {
    case custom(message: String)
}

typealias Handler = (Swift.Result<Any?, APIErrors>) -> Void

class  APIManager {
    static let shareInstance = APIManager()
    func callingRegisterApi(register: RegisterModel, completionHandler: @escaping (Bool,String) -> ())  {
        let headers: HTTPHeaders = [
            .contentType("application/json")
            
        ]
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers,interceptor: nil,requestModifier: nil).response{
            response in debugPrint(response)
            switch response.result{
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200{
                        completionHandler(true,"User registered successfully")
                    }else{
                        completionHandler(false,(json as AnyObject).value(forKey:"message") as! String)
                    }
                    print(json)
                }catch{
                    completionHandler(false,"\(error.localizedDescription)")
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false,"Please try again")
            
            }
        }
    }
//    func callingLoginApi(login: LoginModel) {
//        let headers: HTTPHeaders = [
//            .contentType("application/json")
//
//        ]
//        AF.request(login_url, method: .post,parameters: login,encoder: JSONParameterEncoder.default,headers: headers,interceptor: nil,requestModifier: nil).response{
//            response in debugPrint(response)
//            switch response.result{
//            case .success(let data):
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
//                    print(json)
//                }catch{
//
//                   print(error.localizedDescription)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//
//            }
//        }
//    }
    
    func loginApi(login: LoginModel, completionHandler: @escaping Handler)  {
        let headers: HTTPHeaders = [
            .contentType("application/json")
            
        ]
        AF.request(login_url, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers,interceptor: nil,requestModifier: nil).response{
            response in debugPrint(response)
            switch response.result{
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(ResponseModel.self, from: data!)
                    print(json)
//                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200{
                        completionHandler(.success(json))
                    }else{
                        completionHandler(.failure(.custom(message:"Please try again" )))
                    }
//                    print(json)
                }catch{
                    completionHandler(.failure(.custom(message: "Please try again")))
                    print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(.failure(.custom(message: "Please try again")))
            
            }
        }
    }
    func callingLogoutApi(vc: UIViewController)  {
        let headers: HTTPHeaders = [
            "user-token": "\(TokenService.tokenInstance.getToken)"
        ]
        AF.request(logout_url, method: .get, parameters: nil,headers: headers, interceptor: nil, requestModifier: nil).response{
            response in
            switch response.result{
            case .success(_):
                TokenService.tokenInstance.removeToken()
                vc.navigationController?.popToRootViewController(animated: true)
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
