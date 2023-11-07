//
//  ProfileViewController.swift
//  2-Days
//
//  Created by HAKAN ÖZER on 7.11.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var lblPullData: UILabel!
    var pullData = ""
    static var age:Int = 0
    
    @IBAction func fncExit(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(pullData)
        lblPullData.text = pullData
        print(ProfileViewController.age)
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
