//
//  RegisterViewController.swift
//  Contect
//
//  Created by AlenaziHazal on 11/02/1444 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseCore
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var successfullabel: UILabel!
    @IBOutlet weak var buttenOutlet: UIButton!
    @IBOutlet weak var passwordTextFeild: UITextField!
    let bd = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttenOutlet.layer.cornerRadius = 16
        passwordTextFeild.isSecureTextEntry = true
    }
    @IBAction func Logout(_ sender: Any) {
        logOut()
    }
    func logOut(){
        //Here SginOut
        do{
            try Auth.auth().signOut()
            self.successfullabel.text = "Have a nice day"
        }catch let Error as NSError{
            print("Erorr logOut\(Error)")
        }
    }
    
    @IBAction func saveSignUp(_ sender: Any) {
        register()
        
    }
    func register(){
        let email = emailTextFeild.text
        let password = passwordTextFeild.text
    // Here for create or registerIn ------1--------
            Auth.auth().createUser(withEmail: email!, password: password!) { responce, erorr in
                guard erorr == nil else{
                    print("Erorr\(erorr!.localizedDescription)")
                    return
                }
                self.successfullabel.text = "Registration is success"
                self.performSegue(withIdentifier: "backToLogIn", sender: nil)
            }
    }
}
