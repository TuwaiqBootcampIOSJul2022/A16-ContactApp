//
//  AddContactViewController.swift
//  ContactsApp
//
//  Created by Waad on 11/02/1444 AH.
//

import UIKit
import Firebase

class AddContactViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var field: UITextField!
    
    @IBOutlet weak var phoneLable: UITextField!
   
    var update: (() -> Void)?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(saveTask))

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        return true
    }
    
    
    let db = Firestore.firestore()
   
    
    @objc func saveTask() {
        
        guard let textname = field.text, !textname.isEmpty else {
            return
        }
        guard let textphone = field.text, !textphone.isEmpty else {
            return
        }
        db.collection("Contacts").addDocument(data: ["name": textname ,
                                                     "phoneNumber":textphone
                                             ]){ (error) in
            
            if error != nil {
                print("Error saving user information!")
            }


     }
        navigationController?.popViewController(animated: true)
}

}

