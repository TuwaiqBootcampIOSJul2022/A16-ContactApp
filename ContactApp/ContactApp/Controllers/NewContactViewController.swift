//
//  NewContactViewController.swift
//  ContactApp
//
//  Created by Rashed Shrahili on 12/02/1444 AH.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class NewContactViewController: UIViewController {
    
    //MARK: - db Firestore
    let db = Firestore.firestore()
    
    //MARK: - IBOutlet
    @IBOutlet weak var userAvatarIangeView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var DoneBtn: UIBarButtonItem!
    
    
    //MARK: - Variables
    var contactId:Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        userAvatarIangeView.layer.cornerRadius = userAvatarIangeView.layer.frame.height / 2
        
        firstNameTextField.delegate = self
        
        //MARK: - Read Contacts
        db.collection("contacts")
            //.whereField("studentId", isEqualTo: 3)
            .getDocuments() { (querySnapshot, err) in
            
                guard err == nil else {
                    
                    print("Error getting documents: \(String(describing: err))")
                    return
                }
            
                for document in querySnapshot!.documents {
                    
                    //print("\(document.documentID) => \(document.data())")
                    //print(document.data()["contactId"] as! Int)
                    
                    self.contactId = document.data()["contactId"] as? Int
                    
                }
                
                //print(self.contactId!)
            }
        
    }
    
    //MARK: - IBAction
    @IBAction func addContact(_ sender: UIBarButtonItem) {
        
        //print("Done Here")
        
        addNewContact()
        
    }
    
    //MARK: - Methods
    func addNewContact() {
        
        self.contactId! += 1
        
        db.collection("contacts")
            .addDocument(data: [
                "userId" : Auth.auth().currentUser!.uid,
                "contactId" : self.contactId!,
                "firstName" : firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) as Any,
                "lastName" : lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) as Any
                ,"phone" : phoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) as Any
            ]) { error in
                
                if let e = error {
                    
                    print("Error: \(e)")
                    
                } else {
                    
                    //print("Data Added Succesfully ✅")
                    self.navigationController?.popViewController(animated: true)
                }
            }
    }
}

//MARK: - Extenstions

extension NewContactViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = (firstNameTextField.text! as NSString).replacingCharacters(in: range, with: string)

            if !text.isEmpty{
                
                DoneBtn.isEnabled = true
                
            } else {
                
                DoneBtn.isEnabled = false
                
            }
        
            return true
    }
}
