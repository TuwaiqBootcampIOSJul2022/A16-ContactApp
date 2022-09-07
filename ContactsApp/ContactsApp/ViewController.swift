
import UIKit
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var messageLoginLabel: UILabel!
    
    let db = Firestore.firestore()
    var arrayData:[[String:String]] = [[:]]
    var name:String?
    var email:String?
    var address:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtonOutlet.layer.cornerRadius = 16
        viewBackground.layer.cornerRadius = 16
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toContact"{
            if segue.destination is ContactPageVC{
            }
        }
    }

    @IBAction func logInButton(_ sender: Any) {//toContact
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            guard error == nil else {
                self.messageLoginLabel.text = "\(error!.localizedDescription)"
                return
            }
            print("logged in successfuly")
            self.performSegue(withIdentifier: "toContact", sender: nil)
    }
}
}
