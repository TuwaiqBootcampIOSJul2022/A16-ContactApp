//
//  ViewController.swift
//  App
//
//  Created by REOF ALMESHARI on 07/09/2022.
//

import UIKit
import Firebase
import FirebaseFirestore


class ViewController: UIViewController {
    
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        enterPass.isSecureTextEntry = true
        title = "Contacts"
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "contactsList") as! ContactsViewController
        
        guard let email = enterEmail.text else { return}
        guard let password = enterPass.text else { return}
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let authDataResult = authDataResult else {  return }
            self.present(vc, animated: true)
            
            
            
        }
        
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "signup") as! CreateAccountViewController
        
        present(vc, animated: true)
        
        
    }
    
}

