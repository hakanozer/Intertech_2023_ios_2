//
//  ProductViewController.swift
//  Project
//
//  Created by HAKAN ÖZER on 8.11.2023.
//

import UIKit
import Alamofire
import SCLAlertView
import SDWebImage
import ProgressHUD

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var arr:[Product] = []
    @IBOutlet weak var productTableView: UITableView!
    let refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(path)
        
        refresh.addTarget(self, action: #selector(productResult), for: .valueChanged)
        
        self.productTableView.dataSource = self
        self.productTableView.delegate = self
        
        self.productTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        self.productTableView.addSubview(refresh)
        
        productResult()
    }
    
    
    @objc func productResult() {
        ProgressHUD.show()
        ProgressHUD.animationType = .circleStrokeSpin
        let url = "https://dummyjson.com/products"
        AF.request(url).responseData { res in
            let status = res.response?.statusCode
            if (status == 200) {
                // success
                let data = res.data
                if (data != nil) {
                    let productModel = try? JSONDecoder().decode(ProductsModel.self, from: data!)
                    self.arr = productModel!.products
                    self.productTableView.reloadData()
                    self.refresh.endRefreshing()
                    ProgressHUD.dismiss()
                }
            }else {
                SCLAlertView().showError("Error", subTitle: "Product List Error")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = arr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        cell.txtTitle.text = item.title
        cell.txtPrice.text = "\(item.price)₺"
        
        /*
        let url = URL(string: item.thumbnail)
        let data = try? Data(contentsOf: url!)
        cell.img.image = UIImage(data: data!)
        */
        
        cell.img.sd_setImage(with: URL(string: item.thumbnail))
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = arr[indexPath.row]
        self.performSegue(withIdentifier: "productDetail", sender: item)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "productDetail" ) {
            let item = sender as! Product
            let vc = segue.destination as! ProductDetailViewController
            vc.item = item
        }
    }
    

}
