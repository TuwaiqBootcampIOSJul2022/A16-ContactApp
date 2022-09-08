//
//  SingIN.swift
//  ContesAp
//
//  Created by Hessa on 12/02/1444 AH.
//

import UIKit
//import FirebaseCore
//import FirebaseFirestore
import FirebaseAuth

class SingIN: UIViewController {

//    let db = Firestore.firestore()
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.cornerRadius = 10
    
    }
    

    @IBAction func loginbut(_ sender: Any) {
        let emailuser = email.text
        let pass = password.text
        Auth.auth().signIn(withEmail: emailuser!, password: pass!)
        { result , error in
            guard  error == nil else {
                print(error?.localizedDescription ?? "")
              return
                }
              print("Sing in ✅")
            print(result!.user.uid)
                            }
                }
    
}

 
