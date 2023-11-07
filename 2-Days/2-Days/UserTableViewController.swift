//
//  UserTableViewController.swift
//  2-Days
//
//  Created by HAKAN ÖZER on 7.11.2023.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    var arr: [String] = [
        "Ahmet Yılmaz", "Ayşe Kaya", "Mehmet Özdemir", "Fatma Toprak", "Ali Kocaman",
        "Zeynep Çelik", "Mustafa Yıldız", "Gizem Arslan", "Emre Can", "Elif Şahin",
        "Burak Karadeniz", "Selin Güler", "Kadir Demir", "Ebru Akın", "Serkan Aydoğan",
        "Nur Yılmaz", "Hüseyin Kaya", "Esra Avcı", "Tolga Gür", "Derya Öztürk"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let title = arr[indexPath.row]
        cell.textLabel?.text = title
        
        let i = Int.random(in: 1...2)
        let gender = i == 1 ? "men" : "women"
        let imgUrl = "https://randomuser.me/api/portraits/\(gender)/\(indexPath.row).jpg"
        
        let url = URL(string: imgUrl)
        let data = try! Data(contentsOf: url!)
        //cell.imageView?.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        cell.imageView?.image = UIImage(data: data)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = self.tableView.cellForRow(at: indexPath)
        UserDetailViewController.img = cell?.imageView?.image
        let name = arr[indexPath.row]
        self.performSegue(withIdentifier: "userDetail", sender: name)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "userDetail") {
            let name = sender as! String
            let vc = segue.destination as! UserDetailViewController
            vc.name = name
        }
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
