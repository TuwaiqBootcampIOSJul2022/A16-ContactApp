//
//  signInViewController.swift
//  tableViewFireStore
//
//  Created by Faisal Almutairi on 12/02/1444 AH.
//

import UIKit
import Firebase

class signInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        btn.layer.cornerRadius = 16
    }

    @IBAction func signInBtn(_ sender: Any) {
        

        let email = emailTextField.text!
        let pass = passwordTextField.text!
                
        Auth.auth().signIn(withEmail: email, password: pass) { result, error in
            
            guard error == nil else{
                print("Error \(error!.localizedDescription)")
                return
            }
            print("logged in successfuly")
            print("id : \(result!.user.uid)")
            print("\(result!.user.isEmailVerified)")
            self.performSegue(withIdentifier: "signInMove", sender: nil)

        }
    
    }
}

