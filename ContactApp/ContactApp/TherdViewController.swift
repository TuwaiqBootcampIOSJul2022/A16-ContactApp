//
//  TherdViewController.swift
//  ContactApp
//
//  Created by user on 11/02/1444 AH.
//

import UIKit
import Firebase
struct Information{
   var name = ""
   var  phone = ""
}

var  MyArray : [String] = []

class TherdViewController: UIViewController {
    
    let db = Firestore.firestore()
    @IBOutlet weak var PhoneTextFiled: UITextField!
    @IBOutlet weak var nameTextFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        saveData()
        navigationController?.popViewController(animated: false)
        
    }
    
    func saveData(){
        db.collection("information")
            .addDocument(data:["nameUser":nameTextFiled.text!,
                               "phoneUser":PhoneTextFiled.text!]

            ){ error in
                if let e = error{
                    print(e.localizedDescription)
                }else{
                    print("Data has been Saved ")
                }

            }
        

    }
    

    
}
