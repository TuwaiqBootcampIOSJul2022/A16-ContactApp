//
//  ViewController.swift
//  ContactApp
//
//  Created by user on 11/02/1444 AH.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var passWordTextFild: UITextField!
    
    @IBOutlet weak var emailTextFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func LogInBoutton(_ sender: Any) {
        let email = emailTextFiled.text!
        let pasword = passWordTextFild.text!
        Auth.auth().signIn(withEmail: email, password: pasword){ result,
            error in
            guard error == nil else{
                print("Error\(error!.localizedDescription)")
                return
            }
            print("Login in Successfly")
            print(result?.user.uid)
            self.performSegue(withIdentifier: "move", sender: nil)
            
        }
        
    }
    
}

