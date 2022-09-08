//
//  AddContactViewController.swift
//  App
//
//  Created by REOF ALMESHARI on 07/09/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift



class AddContactViewController: UIViewController {
    let db = Firestore.firestore()
    @DocumentID var id: String? = UUID().uuidString
    
    @IBOutlet weak var contactPhoneNumber: UITextField!
    @IBOutlet weak var contactLastName: UITextField!
    @IBOutlet weak var contactFirstName: UITextField!
    @IBOutlet weak var contactImgAdd: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Addcontact(_ sender: Any) {
        
        guard let firstName = contactFirstName.text else { return}
        guard let lastName = contactLastName.text else { return}
        guard let phoneNum = contactPhoneNumber.text else { return}
        
        let fullName = firstName + lastName
        
        
        db.collection("contacts").addDocument(data:
                                                ["FullName" : fullName ,
                                                 "PhoneNumber" : phoneNum,
                                                 "UID": Auth.auth().currentUser!.uid
                                                 
                                                ]) { error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            print("Successfuly Added ")
            self.dismiss(animated: true)
        }
        
    }
    
    
    //reeuf1@gmail.com
    
    
}
