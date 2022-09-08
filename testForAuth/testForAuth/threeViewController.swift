//
//  threeViewController.swift
//  testForAuth
//
//  Created by Ruba on 11/02/1444 AH.
//

import UIKit
import Firebase
class threeViewController: UIViewController {

    
    let db = Firestore.firestore()
    
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var lN: UITextField!
    @IBOutlet weak var fN: UITextField!
    @IBOutlet weak var addPhoto: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        fN.placeholder = "First name"
        lN.placeholder = "Last name"
        phoneNum.placeholder = "Phone number"
        addPhoto.text = "Add photo"
    }
    
     //Save Data
    @IBAction func done(_ sender: Any) {
        
        db.collection("Done").addDocument(data:[
            "First Name" : fN.text!,
            "Last Name" : lN.text!,
            "Phone Number" : phoneNum.text!
        ])
        { err in
            if let errr = err {
                print("Error adding document: \(errr)")
            } else {
                print("Document added")
            }
        }
        dismiss(animated: true)
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
