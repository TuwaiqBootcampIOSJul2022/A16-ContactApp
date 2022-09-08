//
//  ViewController.swift
//  Contacts
//
//  Created by Kholoud Almutairi on 11/02/1444 AH.
//

import UIKit

var contactArray = [contact]()

class ViewController: UIViewController  {

    var searchArr = [contact]()
    var serching = false
    
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         if let UserContacts = UserDefaults.standard.value(forKey:"MyData") as? Data {
             contactArray = try! PropertyListDecoder().decode(Array<contact>.self, from: UserContacts )
             TableView.reloadData()

             
         }
     }
    
    
     override func viewWillAppear(_ animated: Bool) {
         TableView.reloadData()
     }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchArr = contactArray.filter({$0.FirstName.prefix(searchText.count) == searchText })
        serching = true
        TableView.reloadData()
    }
    
    

}







                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    

extension ViewController :UITableViewDelegate ,UITableViewDataSource , AddContact{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        contactArray.count
        
        if serching{
            return searchArr.count
        }else{
        return contactArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.NlameLabel.text = contactArray[indexPath.row].FirstName

        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Show", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let view = segue.destination as? ViewController3{
            
            view.FName1 = contactArray[sender as! Int].FirstName
            view.LName1 = contactArray[sender as! Int].LastName
            view.PNum1 = contactArray[sender as! Int].PhoneNum

        }
        
        if  let vc  = segue.destination as? ViewController2 {

             vc.delegate = self }
        
        
    }
    
    
    func AddContact(image: String, FName: String, LName: String, PhoneNum: String) {
        contactArray.append(contact(cotImage: image , FirstName: FName, LastName: LName, PhoneNum: PhoneNum))
        
        TableView.reloadData()

    }
    
    
 

}
