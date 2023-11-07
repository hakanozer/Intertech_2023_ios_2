//
//  ViewController.swift
//  2-Days
//
//  Created by HAKAN ÖZER on 7.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func fncGotoProduct(_ sender: UISwipeGestureRecognizer) {
        let pro = Product(title: "TV", price: 5000)
        self.performSegue(withIdentifier: "product", sender: pro)
    }
    
    
    @IBOutlet weak var txtData: UITextField!
    @IBAction func fncSend(_ sender: UIButton) {
        let data = txtData.text
        ProfileViewController.age = 40
        self.performSegue(withIdentifier: "profile", sender: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profile" {
            let data = sender as! String
            let vc = segue.destination as! ProfileViewController
            vc.pullData = data
        }
        if segue.identifier == "product" {
            let pro = sender as! Product
            let vc = segue.destination as! ProductViewController
            vc.item = pro
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

