//
//  LoginViewController.swift
//  Project
//
//  Created by HAKAN ÖZER on 8.11.2023.
//

import UIKit
import Alamofire
import SCLAlertView

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBAction func fncLogin(_ sender: UIButton) {
        
        let username = txtUserName.text!
        let password = txtPassword.text!
        
        if (username == "") {
            SCLAlertView().showWarning("Empty!", subTitle: "Username Empty!")
            txtUserName.becomeFirstResponder()
        }else if (password == "") {
            SCLAlertView().showWarning("Empty!", subTitle: "Password Empty!")
            txtPassword.becomeFirstResponder()
        }else {
            // form send
            let url = "https://dummyjson.com/auth/login"
            let sendObj = ["username": username, "password": password]
            AF.request(url, method: .post, parameters: sendObj ).responseData { res in
                let status = res.response?.statusCode
                if (status == 200) {
                    let data = res.data
                    if (data != nil) {
                        let userModel = try? JSONDecoder().decode(UserModel.self, from: data!)
                        Util.userStore(data: userModel!)
                        self.performSegue(withIdentifier: "home", sender: nil)
                    }
                }else {
                    SCLAlertView().showError("Error", subTitle: "Username or Password Fail!")
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(path)
    }
    

}
