
import UIKit
import FirebaseAuth

class SignUpVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    @IBOutlet weak var viewBackground2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBackground2.layer.cornerRadius = 16
        signUpButtonOutlet.layer.cornerRadius = 16
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: (emailField.text ?? ""), password: (passwordField.text ?? "")) { (result, error) in
                   if let _eror = error {
                       self.messageLabel.text = "\(_eror.localizedDescription)"
                   }else{
                       print(result!)
                       _ = self.navigationController?.popViewController(animated: true)
                   }
                }
    }
}
