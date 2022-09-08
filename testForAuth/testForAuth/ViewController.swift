//
//  ViewController.swift
//  testForAuth
//
//  Created by Ruba on 11/02/1444 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController {


    @IBOutlet weak var signIIn: UIButton!
    @IBOutlet weak var signupp: UIButton!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = "Enter your Email"
        passwordLabel.text = "Enter your Password"
        usernameTxt.placeholder = "example@gmail.com"
        passwordTxt.placeholder = "Password must be at least 6 characters"
        signupp.layer.cornerRadius = 16
        signIIn.layer.cornerRadius = 16
    
    }

    @IBAction func signIn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "vc")
        let email = usernameTxt.text
        let pass = passwordTxt.text
        Auth.auth().signIn(withEmail: email!, password: pass!) { result, err in
            guard err == nil else{
                print("Error \(err)")
                return
        }
            print("successfully")
            self.usernameTxt.text = ""
            self.passwordTxt.text = ""
            self.present(vc!, animated: true)
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "vc")
        let email = usernameTxt.text
        let pass = passwordTxt.text
        Auth.auth().createUser(withEmail: email!, password: pass!) { result, err in
            guard err == nil else{
                print("Error \(err)")
                return
        }
            self.usernameTxt.text = ""
            self.passwordTxt.text = ""
            print("successfully")
            self.present(vc!, animated: true)
        }
        }
    
    
}

