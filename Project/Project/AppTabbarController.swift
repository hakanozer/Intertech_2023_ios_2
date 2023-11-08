//
//  AppTabbarController.swift
//  Project
//
//  Created by HAKAN ÖZER on 8.11.2023.
//

import UIKit

class AppTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("AppTabbarController Call")
        globalBtn()
    }
    
    func globalBtn() {
        
        let buttonSize: CGFloat = 60
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        let tabHeight = tabBar.bounds.height
        
        // View Create
        let view = UIView(frame: CGRect(x: (w - buttonSize - 20), y: (h - tabHeight - buttonSize - 50), width: buttonSize, height: buttonSize))
        //view.backgroundColor = UIColor.red
        
        
        // Button Create
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize))
        btn.setImage(UIImage(named: "gotoBasket"), for: .normal)
        //btn.setImage(UIImage(systemName: "basket"), for: .normal)
        //btn.setTitle("Basket", for: .normal)
        btn.addTarget(self, action: #selector(gotoBasket), for: .touchUpInside)
        
        
        view.addSubview(btn)
        self.view.addSubview(view)
        
    }
    
    @objc func gotoBasket() {
        print("gotoBasket Call")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("AppTabbarController viewDidAppear")
    }
    

}
