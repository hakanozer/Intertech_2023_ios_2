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
    @IBAction func fncSend1(_ sender: UIButton) {
        
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
        
        
        let user1 = User()
        user1.name = "Ali"
        user1.surname = "Bilmem"
        user1.email = "ali@mail.com"
        
        let user2 = User()
        user2.name = "Erkan"
        user2.surname = "Bil"
        user2.email = "erkan@mail.com"
        
        var users: [User] = []
        users.append(user1)
        users.append(user2)
        
        for item in users {
            print(item)
        }
        
        let p1 = Product(title: "TV", price: 20000, status: false)
        let p2 = Product(title: "iPhone", price: 40000, status: true)
        let p3 = Product(title: "Samsung", price: 25000)
        let products:[Product] = [p1,p2, p3]
        
        for item in products {
            print(item)
        }
        
        
        
        // Dictionary
        // Key, Val
        var dic: [String: Any] = ["name": "Kemal", "surname": "Bilirim", "age": 30 ]
        var dic1: [String: Any] = ["name": "Zehra", "surname": "Bil", "age": 25 ]
        var dic2: [String: Any] = ["name": "Ahmet", "surname": "Bilsin", "age": 35 ]
        dic["name"] = "Kenan"
        
        // add item
        dic["status"] = true
        
        // remove item
        //dic.removeValue(forKey: "status")
        print(dic)
        
        
        for (key, val) in dic {
            print("\(key) - \(val)")
        }
        
        var arr4:[Dictionary<String, Any>] = []
        arr4.append(dic)
        arr4.append(dic1)
        arr4.append(dic2)
        
        for item in arr4 {
           print("=================")
            for (key, val) in item {
               print("\(key) \(val)")
            }
        }
        
        // Util Class
        let util = Utils()
        let sm = util.sum(num1: 44,num2: 88)
        print("Sum: \(sm)")
        
    }


}

