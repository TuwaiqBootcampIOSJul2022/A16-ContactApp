//
//  CreateAccountViewController.swift
//  App
//
//  Created by REOF ALMESHARI on 07/09/2022.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var emalText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        
        guard let email = emalText.text else{return}
        guard let password = passText.text else{return}
        
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            print(authDataResult!.user.uid)
            print("Account Added Successfuly")
            
            
        }
        dismiss(animated: true)
    }
    
    
    
}
