import UIKit

class ContactDetailVC: UIViewController {
    
    @IBOutlet weak var viewBackground5: UIView!
    
    @IBOutlet weak var nameContactLabel: UILabel!
    @IBOutlet weak var emailContactLabel: UILabel!
    @IBOutlet weak var phoneNumberContactLabel: UILabel!
    @IBOutlet weak var addressContactLabel: UILabel!
    
    var nameContact:String?
    var emailContact:String?
    var phoneNumberContact:String?
    var addressContact:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBackground5.layer.cornerRadius = 16
        
        nameContactLabel.text = "Name: \(nameContact!)"
        emailContactLabel.text = "Email: \(emailContact!)"
        phoneNumberContactLabel.text = "Phone Number: \(phoneNumberContact!)"
        addressContactLabel.text = "Address: \(addressContact!)"
        
    }
    



}
