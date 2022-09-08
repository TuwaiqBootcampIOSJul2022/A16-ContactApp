//
//  ViewController2.swift
//  LogIn
//
//  Created by Razan Abdullah on 07/09/2022.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class ViewController2: UIViewController {
    
    let db = Firestore.firestore()
    var array:[String] = []

    @IBOutlet weak var dataTextField: UITextField!
    
    @IBOutlet weak var viewTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTable.dataSource = self
        viewTable.delegate = self
        viewTable.register( UINib(nibName: "TableViewCell1", bundle: nil), forCellReuseIdentifier: "cell1")
        
    }
    
   

    @IBAction func saveButtonToTable(_ sender: Any) {
        array.append(dataTextField.text!)
        
        viewTable.reloadData()
    }
    
    @IBAction func saveToFireBase(_ sender: Any) {
        db.collection("Student").addDocument(data: ["name": array])
    }
}

extension ViewController2: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewTable.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell1
        cell.dataLabel.text = array[indexPath.row]
        return cell
    }
    
    
}
