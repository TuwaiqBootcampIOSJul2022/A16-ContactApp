//
//  NewContactViewController.swift
//  Contacts
//
//  Created by Maan Abdullah on 07/09/2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
class NewContactViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    
    //MARK: - Variable
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK: - IBActions
    @IBAction func addBtn(_ sender: Any) {
        if let firstName = firstNameLabel.text,
           let phone = phoneLabel.text {
            db.collection("Contact").document("\(firstName)  \(phone)").setData([
                "userID": "\(Auth.auth().currentUser!.uid)",
                "id": "\(UUID())",
                "firstName": firstName,
                "lastName": lastNameLabel.text as Any,
                "phone": phone
            ]){
                err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
            performSegue(withIdentifier: "returrnToHome", sender: nil)
        }
    }
}
