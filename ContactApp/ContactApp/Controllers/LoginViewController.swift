//
//  LoginViewController.swift
//  ContactApp
//
//  Created by Rashed Shrahili on 12/02/1444 AH.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Variables
    var userId:String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            guard error == nil else {
                
                print("Error: \(error!.localizedDescription)")
                // create the alert
                let alert = UIAlertController(title: "Warning!", message: error!.localizedDescription, preferredStyle: .alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            print("Logged in Successfully")
            //print(result?.user.uid as Any)
            
            self.userId = result!.user.uid
            //print(self.userId!)
            
            self.performSegue(withIdentifier: "loginWay", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "loginWay" {
            
            if let viewVC = segue.destination as? ViewController {
                
                viewVC.uid = self.userId
                viewVC.email = emailTextField.text
            }
        }
    }
    

}
