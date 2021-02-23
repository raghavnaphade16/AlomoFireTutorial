//
//  RegistrationViewController.swift
//  AlmofireTutorial
//
//  Created by Omkar Choudhari on 22/2/21.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
     layer.cornerRadius
     clipsToBounds
     placeholderLabel.textColor
    */
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print(self.firstName.text!)
        password.autocorrectionType = .no
        guard let fName = self.firstName.text else {
            return
        }
        guard let lName = self.lastName.text else {
            return
        }
        guard let email = self.email.text else {
            return
        }
        guard let password = self.password.text else {
            return
        }
        let register = RegisterModel(firstName: fName, lastName: lName, email: email, password: password)
        APIManager.shareInstance.callingRegisterApi(register: register) { (isSuccess,strMessage) in
            //Check data is added or not if Successfully added show alert
            if isSuccess{
                //Alert Box with Navigation
                let alert = UIAlertController(title: "Alert", message: strMessage, preferredStyle: UIAlertController.Style.alert)
                let acceptAction = UIAlertAction(title: "OK", style: .default) { (_) -> Void in
                    let storyboard = UIStoryboard(name: "LogoutView", bundle: nil)
                    let customViewController = storyboard.instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController
                    self.navigationController?.pushViewController(customViewController, animated: true)
                    
                }

        // add an action (button)
        //alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                alert.addAction(acceptAction)
                      // show the alert
                self.present(alert, animated: true, completion: nil)
            }else{
                let alert = UIAlertController(title: "Alert", message: strMessage, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                      // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        //self.navigationController?.popViewController(animated: true)
    }
}
    
    
   
    

