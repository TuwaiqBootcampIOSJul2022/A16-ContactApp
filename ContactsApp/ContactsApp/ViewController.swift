//
//  ViewController.swift
//  ContactsApp
//
//  Created by Waad on 11/02/1444 AH.
//

import UIKit
import Firebase
import FirebaseFirestore


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate{

    
    var name: String?
    var arrayofnames:[String] = []
    let db = Firestore.firestore()

    @IBOutlet weak var myTable: UITableView!
   
    
    //MARK: -
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func LoginAction(_ sender: Any) {
        
        let email = nameField.text!
        let password = passwordField.text!
        Auth.auth().signIn(withEmail: email, password: password) {  result , error in
            guard error == nil else {
            print("Error: \(error!.localizedDescription)")
            return
        }
            print("Logged in Successfuly")
    }
    }
    
    //MARK: - Search bar
    let searchController = UISearchController(searchResultsController: nil)
    func updateSearchResults(for searchController: UISearchController) {
//
//        var searching = false
//        var searchCont = [arrayofnames]
//        let searchText = searchController.searchBar.text!
//
//        if !searchText.isEmpty
//        {
//            searching = true
//            searchCont.removeAll()
//            let contactWho: [arrayofnames]
//
//            for contactWho in arrayofnames
//            {
//                if contactWho["name"].lowercased().contains(searchText.lowercased())
//                {
//                    searchCont.append(contactWho)
//                }
//            }
//        }
//        else
//        {
//            searching = false
//            searchCont.removeAll()
//            searchCont = arrayofnames
//        }
//
//        myTable.reloadData()
//    }
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searching = false
//        searchCont.removeAll()
//        myTable.reloadData()
    }
    
     func configureSearchController()
    {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate   = self
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search for contact"
        
    }
   
    //----------------------------------------------------------------

    @IBAction func AddTab(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! AddContactViewController
    
        self.navigationController?.pushViewController(vc, animated: true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        myTable.delegate = self
        myTable.dataSource = self
       
      //  saveData()
        getData()

        myTable.reloadData()

    }
    //MARK: - Read Data
    
    func getData(){
        
            self.db.collection("Contacts").getDocuments { querySnapshot , error in
                
                guard error == nil else {
                print("Error: \(error!.localizedDescription)")
                return
            }
            for doc in querySnapshot!.documents {
        
                if let name = doc.data()["name"] as? String {
                  
                    self.arrayofnames.append(name)
                }
            }
                    self.myTable.reloadData()
                }
    }
    //MARK: - Write Data to Firestore
    func saveData() {
        db.collection("Contacts").addDocument(data:
                                        ["name" : "reema",
                                         "phoneNumber": "057237280"
                                        ])
        db.collection("Contacts").addDocument(data:
                                        ["name" : "Ali",
                                         "phoneNumber": "057232280" ,
                                        ])
        db.collection("Contacts").addDocument(data:
                                        ["name" : "Abdulaziz",
                                         "phoneNumber": "057637280" ,
                                        ])
        db.collection("Contacts").addDocument(data:
                                        ["name" : "Noura",
                                         "phoneNumber": "057637280" ,
                                        ])
        db.collection("Contacts").addDocument(data:
                                        ["name" : "Sarah",
                                         "phoneNumber": "057637280" ,
                                        ])
        db.collection("Contacts").addDocument(data:
                                        ["name" : "Hanan",
                                         "phoneNumber": "057637280" ,
                                        ])  { error in
                           if let e = error {
                          print(e.localizedDescription)

                        }
                        else {
                       print("Data has been Saved ! ✅")
                          }
 
                   }


      } //end function
    
    //MARK: - tableView Methods
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofnames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = arrayofnames[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //unhighlight cell
        tableView.deselectRow(at: indexPath, animated: true)
        
        //perform segue
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "show") as? ShowDetailsViewController
        
       // let data = arrayofnames[indexPath.row]
   
        db.collection("Contacts").whereField("name", isEqualTo:name!).getDocuments{ querySnapshot , error in
           
            guard error == nil else {
            print("Error: \(error!.localizedDescription)")
            return
        }
          
            for doc in querySnapshot!.documents {
                let data = doc.data()
       
                   vc?.name   = (data["name"] as! String)
                   vc?.number = (data["phoneNumber"] as! String)
            }
        }
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
