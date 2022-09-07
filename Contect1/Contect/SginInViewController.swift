//
//  SginInViewController.swift
//  Contect
//
//  Created by AlenaziHazal on 11/02/1444 AH.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import Firebase
class SginInViewController: UIViewController {
    @IBOutlet weak var emailCheck: UITextField!
    
    @IBOutlet weak var successMasage: UILabel!
    @IBOutlet weak var passwordCheck: UITextField!
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordCheck.isSecureTextEntry = true
        
    }
    
    @IBAction func ClickHere(_ sender: Any) {
        performSegue(withIdentifier: "sginUp", sender: nil)
    }
    @IBAction func LogIn(_ sender: Any) {
//         Here for sginIn ----2-----
        Auth.auth().signIn(withEmail: emailCheck.text!, password: passwordCheck.text!) { response, erorr in
                    guard erorr == nil else{
                        print("Erorr\(erorr!.localizedDescription)")
                        return
                    }
            self.performSegue(withIdentifier: "Login", sender: nil)
                    self.successMasage.text = "Login is successfuly, Welcome \(response!.user.uid)"
        
        
                }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
