//
//  ContactsViewController.swift
//  Contacts
//
//  Created by NosaibahMW on 11/02/1444 AH.
//

import UIKit
import FirebaseFirestore

class ContactsViewController: UIViewController {

    @IBOutlet weak var conactsTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let db = Firestore.firestore()
    var arrayOfContacts : [Conact] = []
    
    var tempArray:[Conact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        conactsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        DispatchQueue.main.async {

            self.getContacts()

        }
        
        self.conactsTableView.reloadData()

        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        DispatchQueue.main.async {

            self.getContacts()


        }
        
        self.conactsTableView.reloadData()

        
    }
    
    
    func getContacts(){
        
            self.db.collection("Contacts").getDocuments { querySnapshot , error in
            
                self.arrayOfContacts = [] //reset array to prevent redundancy after add a new contact to db
                
                for doc in querySnapshot!.documents {
                    let data = doc.data()
                    self.arrayOfContacts.append(Conact(name: data["name"] as! String, phoneNumber: data["phoneNumber"] as! String, email: data["email"] as! String))
                    
                }
                    self.tempArray = self.arrayOfContacts
                    self.conactsTableView.reloadData()
                }
    }
    
    

}


extension ContactsViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = conactsTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        cell.contactNameLabel.text = tempArray[indexPath.row].name
        
        return cell
    }

}



extension ContactsViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetails" {
            if let secondVC = segue.destination as? ContactDetailsViewController {
                secondVC.contact = tempArray[sender as! Int]
            }
        }
    }
    
    
}


extension ContactsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tempArray = []
                
        if searchText == "" {
            tempArray = arrayOfContacts
        }
        
        for searchWordObj in arrayOfContacts {
            if searchWordObj.name.uppercased().contains(searchText.uppercased()){
                tempArray.append(searchWordObj)
            }
        }
        
        DispatchQueue.main.async {
            self.conactsTableView.reloadData()
        }
    }
}
