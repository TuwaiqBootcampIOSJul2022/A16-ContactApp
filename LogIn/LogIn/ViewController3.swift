//
//  ViewController3.swift
//  LogIn
//
//  Created by Razan Abdullah on 07/09/2022.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class ViewController3: UIViewController {
    
   let db = Firestore.firestore()
   var allProducts = [""]

    @IBOutlet weak var viewTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTable.dataSource = self
        viewTable.delegate = self
      viewTable.register( UINib(nibName: "TableViewCell2", bundle: nil), forCellReuseIdentifier: "cell2")
    }
    
    func readData(){
        db.collection("users")
            .getDocuments { querySnapshot, error in
            
           guard error == nil else {
              
                return
            }
           
            
            for doc in querySnapshot!.documents{
                let data = doc.data()
                let arr = data["product"] as! [String]
                self.allProducts += arr
            }
                print(self.allProducts)
        }
    }
    
}

extension ViewController3: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewTable.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell2
       // cell.dataLabel.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "cell2", sender: nil)
    }



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cell2" {
     //       db.collection("Student").addDocument(data: ["name": array])
            }
        }
    
    
}


