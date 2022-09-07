//
//  SigninViewController.swift
//  Contacts
//
//  Created by Maan Abdullah on 07/09/2022.
//

import UIKit
import FirebaseAuth
class SigninViewController: UIViewController {
     
    //MARK: - IBOutlets
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - IBActions
    @IBAction func signinBtnPressed(_ sender: Any) {
        signIn()
    }
    
    @IBAction func unwindToThis(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
    }
    
    //MARK: - Methods
    func signIn(){
        guard emailTxtField.text?.isEmpty == false  else {
            let popup = UIAlertController(title: "Warning", message: "Insert email", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            popup.addAction(action)
            self.present(popup, animated: true, completion: nil)
            return
        }
        guard passwordTxtField.text?.isEmpty == false else {
            let popup = UIAlertController(title: "Warning", message: "Insert password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            popup.addAction(action)
            self.present(popup, animated: true, completion: nil)
            return
        }
        Auth.auth().signIn(withEmail: emailTxtField.text!, password: passwordTxtField.text!){ authResult, error in
            guard error == nil else {
                let popup = UIAlertController(title: "Error", message: "\(error!.localizedDescription)", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                popup.addAction(action)
                self.present(popup, animated: true)
                return
            }
            
            let popup = UIAlertController(title: "OK", message: "Login successfully", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeContact")
                self.present(vc!, animated: true)
            }
            popup.addAction(action)
            self.present(popup, animated: true)
            
        }
        
        
    }
}
