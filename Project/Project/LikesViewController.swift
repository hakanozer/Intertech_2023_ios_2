//
//  LikesViewController.swift
//  Project
//
//  Created by HAKAN ÖZER on 8.11.2023.
//

import UIKit
import SQLite
import Alamofire
import SCLAlertView
import SDWebImage

class LikesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var productTableView: UITableView!
    
    var arr:[Product] = []
    let db = try! Connection(Util.sqlitePath)
    let likes = Table("likes")
    let lid = Expression<Int64>("lid")
    let pid = Expression<Int64>("pid")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.productTableView.dataSource = self
        self.productTableView.delegate = self
        
        self.productTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        arr = []
        productTableView.reloadData()
        for item in try! db.prepare(likes) {
            let dbLid = item[lid]
            let dbPid = item[pid]
            
            let url = "https://dummyjson.com/products/\(dbPid)"
            AF.request(url).responseData { res in
                let data = res.data
                if (data != nil) {
                    let product = try! JSONDecoder().decode(Product.self, from: data!)
                    self.arr.append(product)
                    self.productTableView.reloadData()
                }
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
