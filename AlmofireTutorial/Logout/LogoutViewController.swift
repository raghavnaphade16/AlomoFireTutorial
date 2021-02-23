//
//  LogoutViewController.swift
//  AlmofireTutorial
//
//  Created by Omkar Choudhari on 22/2/21.
//

import UIKit

class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        APIManager.shareInstance.callingLogoutApi(vc: self)
//        TokenService.tokenInstance.removeToken()
//        self.navigationController?.popToRootViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
