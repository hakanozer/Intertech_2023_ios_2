//
//  UserDetailViewController.swift
//  2-Days
//
//  Created by HAKAN ÖZER on 7.11.2023.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBAction func fncExit(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    
    var name: String = ""
    static var img: UIImage? = nil
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = name
        if (UserDetailViewController.img != nil) {
            userImage.image = UserDetailViewController.img
        }
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
