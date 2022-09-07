
import UIKit
import Firebase

class ContactPageVC: UIViewController {

    @IBOutlet weak var viewBackground3: UIView!
    @IBOutlet weak var contactsTabelView: UITableView!
    
    var arrayData:[[String:String]] = [[:]]
    let db = Firestore.firestore()
    
    var name:String?
    var email:String?
    var phoneNumber: String?
    var address:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBackground3.layer.cornerRadius = 16
        contactsTabelView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        readData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showContact"{
            if let viewVC = segue.destination as? ContactDetailVC{
                viewVC.nameContact = name
                viewVC.emailContact = email
                viewVC.phoneNumberContact = phoneNumber
                viewVC.addressContact = address
            }
        }
    }
    
    func readData(){
        db.collection("Contact").getDocuments() { (querySnapshot, err) in
            guard err == nil else {
                print("Error getting documents: \(String(describing: err?.localizedDescription))")
                return
            }
            self.arrayData.removeAll()
            for document in querySnapshot!.documents {
                let item = document.data()
                let nameDB = item["Name"] as! String
                let emailDB = item["Email"] as! String
                let numberDB = item["PhoneNumber"] as! String
                let addressDB = item["Address"] as! String

                self.arrayData.append(["Name":nameDB, "Email":emailDB, "PhoneNumber":numberDB, "Address":addressDB])
            }
            print(self.arrayData)
            self.contactsTabelView.reloadData()
        }
    }
}

extension ContactPageVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            cell.NameLabel.text = arrayData[indexPath.row]["Name"]

        return cell
    }
}

extension ContactPageVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        name = arrayData[indexPath.row]["Name"]
        email = arrayData[indexPath.row]["Email"]
        phoneNumber = arrayData[indexPath.row]["PhoneNumber"]//showContact
        address = arrayData[indexPath.row]["Address"]
        
        performSegue(withIdentifier: "showContact", sender: nil)
    }
}
