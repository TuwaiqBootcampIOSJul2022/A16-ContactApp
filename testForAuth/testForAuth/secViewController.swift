//
//  secViewController.swift
//  testForAuth
//
//  Created by Ruba on 11/02/1444 AH.
//

import UIKit
import Firebase

class secViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
   
    var arrRows = ["Ali","Amal","Abdullah","Bilal","Bader","Cristina","Dana","Doha","Eman"]
    var data = [String]()
    var search1 = false

    @IBOutlet weak var signouut: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "cellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        search.placeholder = "Search"
        search.delegate = self
        signouut.layer.cornerRadius = 16
        saveData()
        readData()
    }
    
    func saveData(){
        ref = db.collection("Arrays")
            .addDocument(data:[
                "Array" : arrRows
                
            ]) {err in
        if let err = err{
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
        }
        }
    func readData(){
       db.collection("Done").getDocuments{ QuerySnapshot, err in
            guard err == nil else{
                       print("Error getting documents: \(err)")
                return
            }
           for doc in QuerySnapshot!.documents{
               let arr = doc.data()
               let firstName = arr["First Name"] as! String
               let lastName = arr["Last Name"] as! String
               let phone = arr["Phone Number"] as! String
               
           }
        }
       
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if search1{
           return data.count
        }else{
        return arrRows.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if search1{
            cell.textLabel?.text = data[indexPath.row]
        }else{
        cell.textLabel?.text = arrRows[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "vc2") as! fourViewController
        vc.fname = arrRows[indexPath.row]
        self.present(vc, animated: true)
      
    }
    
    @IBAction func plus(_ sender: Any) {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "vc1")
        self.present(vc1!, animated: true)
    }
    
   
    @IBAction func signout(_ sender: Any) {
        let out = Auth.auth()
        do{
            try out.signOut()
        }catch let outerror as NSError{
            print("Error signout" , outerror)
        }
    dismiss(animated: true)
    }
    
}
extension secViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        data = arrRows.filter({$0.prefix(searchText.count) == searchText})
      search1 = true
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search1 = false
        search.text = ""
        tableView.reloadData()
    }
}
