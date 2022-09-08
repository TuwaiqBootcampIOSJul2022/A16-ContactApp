//
//  ViewController.swift
//  ContactApp
//
//  Created by Rashed Shrahili on 11/02/1444 AH.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class ViewController: UIViewController {
    
    
    //MARK: - IBOutlet
    @IBOutlet weak var contactsTableView: UITableView!
    
    //MARK: - db Firestore
    let db = Firestore.firestore()
    
    //MARK: - Variables
    let searchController = UISearchController(searchResultsController: nil)
    var contactDefault = [[String:Any]]()
    var searching = false
    var index:Int?
    
    var uid:String?
    var email:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        
        contactsTableView.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "contactCell")
        
        configureSearchController()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //MARK: - Read Contacts
        db.collection("contacts")
            .whereField("userId", isEqualTo: Auth.auth().currentUser!.uid)
            .getDocuments() { (querySnapshot, err) in
                
                guard err == nil else {
                    
                    print("Error getting documents: \(String(describing: err))")
                    return
                }
                
                contactsArr.removeAll()
                
                for document in querySnapshot!.documents {
                    
                    //print("\(document.documentID) => \(document.data())")
                    //print(document.data()["studentId"] as! Int)
                    contactsArr.append(document.data())
                    
                }
                
                self.contactsTableView.reloadData()
                //print(self.uid as Any)
                
            }
        
    }
    
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactsArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        
        cell.contactNameLabel.text = "\(String(describing: contactsArr[indexPath.row]["firstName"]!)) \(String(describing: contactsArr[indexPath.row]["lastName"]!))"
        
        return cell
    }
    
    
    
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        index = indexPath.row
        
        performSegue(withIdentifier: "contactdetailWay", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "contactdetailWay" {
            
            if let viewVC = segue.destination as? ContactDetailViewController {
                
                viewVC.fullName = "\(String(describing: contactsArr[index!]["firstName"]!)) \(String(describing: contactsArr[index!]["lastName"]!))"
                
                viewVC.phoneNumber = contactsArr[index!]["phone"] as? String
            }
        }
        
    }
}

extension ViewController : UISearchBarDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
//                let searchText = searchController.searchBar.text!
//                if !searchText.isEmpty
//                {
//                    searching = true
//                    contactDefault.removeAll()
//
//                    for contact in contactsArr
//                    {
//
//                        if let itemId = item["id"]{
//
//                            if(itemId != nil){
//
//                                newArr.append(item)
//                            }
//                        }
//
//                        if contact.filter({ $0.value as! String == searchText.lowercased() })
//                        {
//                           contactDefault.append(contact)
//                       }
//
//                        //print(contact["firstName"]!)
//                    }
//                }
//                else
//                {
//
//                    searching = false
//                    contactDefault.removeAll()
//                    contactDefault = contactsArr
//                }
//
//        contactsTableView.reloadData()
    }
    
    func configureSearchController() {
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate   = self
        // searchController.searchBar.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Contact Search"
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searching = false
        contactDefault.removeAll()
        contactsTableView.reloadData()
    }
    
}

