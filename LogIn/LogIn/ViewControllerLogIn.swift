//
//  ViewControllerLogIn.swift
//  LogIn
//
//  Created by Razan Abdullah on 07/09/2022.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class ViewControllerLogIn: UIViewController {
    
   // let db = Firestore.firestore()

    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func loginButton(_ sender: Any) {
        let email = EmailTextField.text!
        let password = PasswordTextField.text!
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error == nil else{
                print("Error: \(error?.localizedDescription)")
                return
            }
            print("🥳")
        }
    }
    }
    
