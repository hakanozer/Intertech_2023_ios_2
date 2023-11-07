//
//  ProductViewController.swift
//  2-Days
//
//  Created by HAKAN ÖZER on 7.11.2023.
//

import UIKit

class ProductViewController: UIViewController {
    
    var item: Product?
    
    @IBOutlet weak var lblPullData: UILabel!
    @IBAction func fncExit(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if item != nil {
            print(item!)
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
