//
//  ViewController.swift
//  tableViewFireStore
//
//  Created by Faisal Almutairi on 11/02/1444 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var contactSearchBar: UISearchBar!
    @IBOutlet weak var contactTableView: UITableView!
    
    let db = Firestore.firestore()
    var arrayName : [[String:Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTableView.delegate = self
        contactTableView.dataSource = self
        contactTableView.layer.cornerRadius = 16
        contactSearchBar.layer.cornerRadius = 16
        
        contactTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
        readData()
    }


    @IBAction func addActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "move", sender: nil)
    }
    
    
    func readData(){
        db.collection("users").getDocuments { querySnapshot, error in
            
            for i in querySnapshot!.documents{
                let data = i.data()
                print(data["FirstName"] as? String)
                self.arrayName.append(data)
            }
            self.contactTableView.reloadData()
        }
    }
}


extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.fristNameLabel.text = arrayName[indexPath.row]["FirstName"] as! String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "move2", sender: nil)
    }
    
}


