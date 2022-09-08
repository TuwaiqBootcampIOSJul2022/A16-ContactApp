//
//  ViewController.swift
//  k1
//
//  Created by sarahAldosari on 10/02/1444 AH.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
class ViewController: UIViewController {
    var array:[[String: Any]] = []
    var nameSend = ""
    var numSend = ""
    
    @IBOutlet weak var MyTableView: UITableView!
    @IBOutlet weak var Serch: UITextField!
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        readData()
//       saveData()
        // Do any additional setup after loading the view.
        
     
        
        
        
    }
    
    func readData(){
        db.collection("Names").getDocuments { querySnapshot, error in
            guard error == nil else{
               print("Eerror: \(error!.localizedDescription)")

               return
            }
            for doc in  querySnapshot!.documents {
                let data = doc.data()
              //  let numberDB = data["PhoneNumber"] as! String

                print(data["name"] as! String)

                self.array.append(doc.data())


            }
            
            self.MyTableView.reloadData()


        }



    }
   
    
    @IBAction func Add(_ sender: Any) {
     //   array.append(name.text!)
        
        MyTableView.reloadData()
    }
}

   
    
    
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.name.text = array[indexPath.row]["name"] as? String
       // cell.num.text = array[indexPath.row]["num"] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { nameSend = (array[indexPath.row]["name"] as? String)!
        
        
      //numSend = (array[indexPath.row]["num"] as? String)!
        performSegue(withIdentifier: "move", sender: nil)
       
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "move" {
            
            if let viewVC = segue.destination as? ViewController2 {
                
                viewVC.name = nameSend
                viewVC.num = numSend
               // viewVC.num = numSend
            }
        }
    }
    
    
    
}
//
//struct contact : Codable{
//     var cotImage : String? = nil
//     var FirstName : String
//     var LastName : String
//     var PhoneNum : String
//
// }
