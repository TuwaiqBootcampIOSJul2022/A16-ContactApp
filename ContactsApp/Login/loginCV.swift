//
//  loginCV.swift
//  Contacts
//
//  Created by Kholoud Almutairi on 12/02/1444 AH.
//

import UIKit
import Firebase
import FirebaseCore


class loginCV: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func LoginButton(_ sender: Any) {//toContact
        let email = emailTextField.text!
        let password = passwordTextField.text!

        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            guard error == nil else {
                return
            }
            print("looog in successfuly")
            self.performSegue(withIdentifier: "Contact", sender: nil)
    }

    }}
