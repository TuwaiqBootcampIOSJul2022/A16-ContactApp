//
//  ViewController.swift
//  LogIn
//
//  Created by Razan Abdullah on 06/09/2022.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class ViewController: UIViewController {
    
    let db = Firestore.firestore()
   
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readData()
       
    }

    @IBAction func authenticateUser(_ sender: Any) {
        let email = EmailTextField.text!
        let password = PasswordTextField.text!
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error == nil else{
                print("Error: \(error?.localizedDescription)")
                return
            }
            print("🥳")
           
        }
       // result?.user.uid =
    }
    
    func readData(){
        db.collection("orders")
            .whereField("productID", isEqualTo: "A345")
            .getDocuments { querySnapshot, error in
            
           guard error == nil else {
               print(error?.localizedDescription)
                return
            }
           
            
            for doc in querySnapshot!.documents{
                let data = doc.data()
                print(data["product"] as! String)
            }
        }
    }
    
    @IBAction func signOut(_ sender: Any) {
       // Auth.auth().signOut()
    }
    
    func saveData(){
        db.collection("users").addDocument(data: [
            "name" : "Yazan",
            "bd" : "2001",
            "PhoneNumber" : "0500505",
            "address" : "KSA"
        ]) { error in           //trailling closer
            if let e = error {
                print(e.localizedDescription)
            }else{
                print("Data has been saved ✅")
            }
            
        }
        
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
      saveData()
       
    }
    
    
    
}

