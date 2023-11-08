//
//  ProductViewController.swift
//  Project
//
//  Created by HAKAN ÖZER on 8.11.2023.
//

import UIKit
import Alamofire

class ProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("ProductViewController call")
        
        let user = Util.userData()
        if (user != nil) {
            print(user!)
        }
        
    }
    
    

}
