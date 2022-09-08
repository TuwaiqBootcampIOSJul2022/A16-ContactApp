//
//  ViewControllerSearchandInfo.swift
//  LogIn
//
//  Created by Razan Abdullah on 07/09/2022.
//

import UIKit

class ViewControllerSearchandInfo: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
//    var names = contacts[indexPath.row].name
//    var emails = contacts[indexPath.row].email
//    var phones = contacts[indexPath.row].phone
    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var viewTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTable.dataSource = self
        viewTable.delegate = self
        viewTable.register(UINib(nibName: "TableViewCell11", bundle: nil), forCellReuseIdentifier: "cells")
      
    }
    
//    let resault = contact.filter {
//        $0.name.contains("A")
//    }
//    
//    print(resault)

    
    @IBAction func AddNameButton(_ sender: Any) {
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewTable.dequeueReusableCell(withIdentifier: "cells", for: indexPath) as! TableViewCell11
       
        cell.NameLabel.text = contacts[indexPath.row].name
        cell.EmailLabel.text = contacts[indexPath.row].email
        cell.PhoneLabel.text = contacts[indexPath.row].phone
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "move", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "move"{
            if let detailsVC = segue.destination as? ViewControllerDetails {
//                detailsVC.Name = names
//                detailsVC.Email = emails
//                detailsVC.Phone = phones
            
            }
    }
}
    
    
}

