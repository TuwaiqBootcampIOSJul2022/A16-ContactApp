//
//  secondViewController.swift
//  tableViewFireStore
//
//  Created by Faisal Almutairi on 11/02/1444 AH.
//

import UIKit
import FirebaseFirestore

class secondViewController: UIViewController {

    let db = Firestore.firestore()

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.cornerRadius = 16
        firstNameTextField.placeholder = "Enter the frist name"
        lastNameTextField.placeholder = "Enter the last name"
        phoneNumberTextField.placeholder = "Enter the phone number"

    }
    
    func saveData(){
        db.collection("users")
            .addDocument(data: [
                "ID" : "\(UUID())",
                "FirstName" : firstNameTextField.text!,
                "LastName" : lastNameTextField.text!,
                "phoneNumber" : phoneNumberTextField.text!,
            ]){ error in
                if let e = error{
                    print(e.localizedDescription)
                }else{
                    print("Done Saving")
                }

            }
    }

    @IBAction func saveDataBtn(_ sender: Any) {
        
        saveData()
        navigationController?.popViewController(animated: true)
    }
}
