//
//  ViewController.swift
//  Contacts
//
//  Created by NosaibahMW on 11/02/1444 AH.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordtextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
    }

    @IBAction func loginButtonAction(_ sender: Any) {
        
        
        let email = userNameTextField.text!
        let password = passwordtextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print("Error \(error!.localizedDescription)")
                return
            }
            
            print("Logged in successfully")
            print(result?.user.uid)
            self.performSegue(withIdentifier: "logedInSegue", sender: nil)
        }
        
    }
    
}

