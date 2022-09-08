//
//  AddContactViewController.swift
//  Contacts
//
//  Created by NosaibahMW on 12/02/1444 AH.
//

import UIKit
import FirebaseFirestore

class AddContactViewController: UIViewController {

    @IBOutlet weak var nameTextFeild: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.layer.cornerRadius = 5
    }
    
    @IBAction func AddContactButton(_ sender: Any) {
        
        db.collection("Contacts").addDocument(data: ["name": nameTextFeild.text,
                                                     "email": emailTextField.text,
                                                     "phoneNumber": phoneNumberTextField.text])
        
        navigationController?.popViewController(animated: false)
    }
    
}
