//
//  ContactsViewController.swift
//  App
//
//  Created by REOF ALMESHARI on 07/09/2022.
//

import UIKit
import Firebase
import FirebaseFirestore

class ContactsViewController: UIViewController {
    var contactsList : [String] = []
    let db = Firestore.firestore()
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchOutlet: UISearchBar!
    let searchController = UISearchController()
    var searchdata : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchOutlet.delegate = self
        tableview.delegate = self
        tableview.dataSource = self
        tableview.reloadData()
        searchdata = contactsList
        
        
        Fetch()
    }
    
    func Fetch(){
        
        db.collection("contacts").whereField("UID", isEqualTo: Auth.auth().currentUser!.uid).getDocuments{ querySnapshot, error in
            
            guard error == nil else {
                print(error!.localizedDescription)
                
                return}
            
            
            for doc in querySnapshot!.documents {
                let data =
                doc.data()
                DispatchQueue.main.async {
                    self.contactsList.append(data["FullName"] as! String)
                    self.searchdata = self.contactsList
                    self.tableview.reloadData()
                    
                    print(self.contactsList)
                }
                
                
            }
            
            
            
            
            
            
        }
    }
    
    @IBAction func addContactButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "addContact") as! AddContactViewController
        //
        //        navigationController?.pushViewController(vc, animated: true)
        
        
        present(vc, animated: true)
        
    }
    
    
    
    @IBAction func signOut(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.dismiss(animated: true)
            print("LogOut Successfuly")
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
        
        
    }
    
}


extension ContactsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = searchdata[indexPath.row]
        
        return cell
    }
    
    
}

extension ContactsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "PreviewContact") as! PreviewContactViewController
        
        
        
        
        
        present(vc, animated: true)
        
    }
    
}

extension ContactsViewController : UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        
        
        searchBar.endEditing(true)
        
        tableview.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchdata = contactsList.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
        
        tableview.reloadData()
        
        
    }
    
    
    
}

