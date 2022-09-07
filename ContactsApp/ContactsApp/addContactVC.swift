import UIKit
import Firebase

class addContactVC: UIViewController {
    
    @IBOutlet weak var viewBackground4: UIView!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    @IBOutlet weak var nameAddField: UITextField!
    @IBOutlet weak var emailAddField: UITextField!
    @IBOutlet weak var phoneAddField: UITextField!
    @IBOutlet weak var addressAddField: UITextField!
    
    @IBOutlet weak var messageAddLabel: UILabel!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBackground4.layer.cornerRadius = 16
        saveButtonOutlet.layer.cornerRadius = 16
    }


    @IBAction func saveButton(_ sender: Any) {
        if nameAddField.text != "" && emailAddField.text != "" && phoneAddField.text != "" && addressAddField.text != "" {
            db.collection("Contact").addDocument(data: [
                "Name": self.nameAddField.text!,
                "Email": self.emailAddField.text!,
                "PhoneNumber": self.phoneAddField.text!,
                "Address": self.addressAddField.text!
            ]) { error in
                if let e = error{
                    self.messageAddLabel.text =  e.localizedDescription
                }else{
                    print("Data Has Been Saved")
                    _ = self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
