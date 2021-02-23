//
//  ViewController.swift
//  AlmofireTutorial
//
//  Created by Omkar Choudhari on 20/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textFirstName: UITextField!
    @IBOutlet var textLastName: UITextField!
    @IBOutlet var textEmail: UITextField!
    @IBOutlet var textPassword: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        var runCount = 0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("Timer fired!")
            runCount += 1

            if runCount == 3 {
                timer.invalidate()
                // Create a reference to the the appropriate storyboard
                let storyboard = UIStoryboard(name: "LoginView", bundle: nil)
                // Instantiate the desired view controller from the storyboard using the view controllers identifier
                // Cast is as the custom view controller type you created in order to access it's properties and methods
                let customViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                self.navigationController?.pushViewController(customViewController, animated: true)
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        var runCount = 0
//        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//            print("Timer fired!")
//            runCount += 1
//
//            if runCount == 3 {
//                timer.invalidate()
//                // Create a reference to the the appropriate storyboard
//                let storyboard = UIStoryboard(name: "LoginView", bundle: nil)
//                // Instantiate the desired view controller from the storyboard using the view controllers identifier
//                // Cast is as the custom view controller type you created in order to access it's properties and methods
//                let customViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//                self.navigationController?.pushViewController(customViewController, animated: true)
//
//            }
//        }
        
    }


  
}
//Navigation Code
//let storyboard = UIStoryboard(name: "RegistrationView", bundle: nil)
//let customViewController = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
//self.navigationController?.pushViewController(customViewController, animated: true)
