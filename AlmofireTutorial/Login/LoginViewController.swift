//
//  LoginViewController.swift
//  AlmofireTutorial
//
//  Created by Omkar Choudhari on 22/2/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var textEmail: UITextField!
    
    
    @IBOutlet var textPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        guard let email = self.textEmail.text else {
            return
        }
        guard let password = self.textPassword.text else {
            return
        }
        
        let login = LoginModel(login: email, password: password)
        APIManager.shareInstance.loginApi(login: login) { (result) in
            switch result{
            case .success(let json):
                print(json!)

//                let resEmail = (json as AnyObject).value(forKey:"email") as! String
//                let resFirstName = (json as AnyObject).value(forKey:"firstName") as! String
//                let resLastName = (json as AnyObject).value(forKey:"lastName") as! String

//                let modelLoginResponse = LoginResponseModel(firstName: resFirstName, lastName: resLastName, email: resEmail)
//                print(modelLoginResponse)
                let fname = (( json as! ResponseModel)).firstName
                let usrToken = (( json as! ResponseModel)).userToken
                
                TokenService.tokenInstance.saveToken(token: usrToken)
               
                let alert = UIAlertController(title: "Hello \(fname)", message: "Login Success", preferredStyle: UIAlertController.Style.alert)

               // alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                let acceptAction = UIAlertAction(title: "OK", style: .default) { (_) -> Void in
                    let storyboard = UIStoryboard(name: "LogoutView", bundle: nil)
                    let customViewController = storyboard.instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController
                    self.navigationController?.pushViewController(customViewController, animated: true)
                    
                }
                alert.addAction(acceptAction)
                      // show the alert
                self.present(alert, animated: true, completion: nil)


            case .failure(let err):
                print(err.localizedDescription)
               
                let alert = UIAlertController(title: "Alert", message:"Error", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                      // show the alert
                self.present(alert, animated: true, completion: nil)

            }
        }
        
//        APIManager.shareInstance.callingLoginApi(login: login)
//
//        let storyboard = UIStoryboard(name: "LogoutView", bundle: nil)
//        let customViewController = storyboard.instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController
//        self.navigationController?.pushViewController(customViewController, animated: true)

        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func registrationButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "RegistrationView", bundle: nil)
        let customViewController = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        self.navigationController?.pushViewController(customViewController, animated: true)

    }
}
