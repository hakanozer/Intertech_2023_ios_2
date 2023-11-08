//
//  WelcomeViewController.swift
//  Project
//
//  Created by HAKAN ÖZER on 8.11.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        let user = Util.userData()
        if (user == nil) {
            self.performSegue(withIdentifier: "login", sender: nil)
        }else {
            self.performSegue(withIdentifier: "home", sender: nil)
        }
        
    }
    
    

}
