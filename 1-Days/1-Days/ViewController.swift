//
//  ViewController.swift
//  1-Days
//
//  Created by HAKAN ÖZER on 6.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBAction func fncSend(_ sender: UIButton) {
        
        let email = txtEmail.text!
        let password = txtPassword.text!
        print("\(email) \(password)")
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // one line comment
        /*
         Multiline cooment
         */
        
        // let, var
        // let -> sabit(const, final)
        // var -> değişim
        let name = "Ali"
        var surname = "Bilmem"
        let age = 30
        let num1:Float = 10.2
        
        print(name)
        print("Name: \(name) Surname: \(surname)")
        
        let num2: Int? = 20
        var num3:Int?
        
        num3 = 50
        if (num3 == nil) {
            print("num3 nil")
        }else {
            print("num3 success")
        }
        
        print(num3 ?? 30)
        
        if let city:String? = "İstanbul" {
            print(city!)
        }
        
        // Arrays
        var arr = ["İstanbul"]
        var arr1:[String] = []
        
        // add element
        arr.append("Ankara")
        arr.append("Bursa")
        arr.append("İzmir")
        arr.append("Antalya")
        arr.append("Konya")
        
        // get element
        print(arr[1])
        
        // remove element
        arr.remove(at: 0)
        
        print(arr)
        
        // loop
        for item in arr {
           print(item)
        }
        print(arr.count)
        
        for i in 2...arr.count - 1 {
            print( arr[i] )
        }
        
        var arr3:[Any] = []
        arr3.append("")
        arr3.append(100)
        let itm1 = arr3[0]
        
        
        
    }


}

