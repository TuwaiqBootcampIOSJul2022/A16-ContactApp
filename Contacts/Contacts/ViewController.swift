//
//  ViewController.swift
//  Contacts
//
//  Created by Maan Abdullah on 07/09/2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
class ViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    //MARK: - Variable
    var contacts: [[String: Any]] = [[:]]
    var filteredContact: [[String: Any]] = [[:]]
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        let textFieldOfSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldOfSearchBar?.textColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        contacts.removeAll()
        getData()
        filteredContact = contacts
    }
    
    //MARK: - Methods
    func getData(){
        db.collection("Contact").whereField("userID", isEqualTo: (Auth.auth().currentUser!.uid) ).getDocuments(completion:{ (querySnapshot, err) in
            if let err = err{
                print("Error getting data: \(err.localizedDescription)")
            }
            for doc in querySnapshot!.documents{
                let data = doc.data()
                self.contacts.append(data)
            }
            self.filteredContact = self.contacts
            self.tableView.reloadData()
        }
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dis = segue.destination as? ContactDetailViewController else {
            return
            
        }
        guard let index = sender as? IndexPath else {
            return
        }
        dis.id = (filteredContact[index.row]["id"] as? String)!
        
    }
    
    @IBAction func unwindToThis(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
    }
}


//MARK: - Adopt UITableView DataSource & Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredContact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCellTableViewCell
        if let firstName = filteredContact[indexPath.row]["firstName"]{
            if let lastName = filteredContact[indexPath.row]["lastName"]{
                cell.nameLabel.text = "\(firstName as! String) \(lastName as! String)"
                
            }
            else{
                cell.nameLabel.text = firstName as! String
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "contactDetail", sender: indexPath)
    }
    
    
}


//MARK: - Adopt UISearchBar Delegate
extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredContact = contacts.filter{($0["firstName"] as! String).lowercased().hasPrefix(searchText.lowercased())}
        tableView.reloadData()
    }
}
