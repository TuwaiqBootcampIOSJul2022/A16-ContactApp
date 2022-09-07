//
//  AddContectViewController.swift
//  Contect
//
//  Created by AlenaziHazal on 11/02/1444 AH.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
class AddContectViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var savePress: UIBarButtonItem!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lastName: UITextField!
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.height / 2
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func save(_ sender: Any) {
    }
    func saveData(){
        db.collection("contect").addDocument(data: [
            "firstName":firstName.text!,
            "lastName":lastName.text!,
            "phoneNumber":phoneNumber.text!
        ]){ error in
            if let e = error{
                print(e.localizedDescription)
            }else{
                print("Has been saved")
            }
            
        }
    }
    func updateSavePress(){
        let shouldSave = firstName.text?.isEmpty == false
        savePress.isEnabled = shouldSave
    }
    @IBAction func textFirst(_ sender: UITextField) {
        updateSavePress()
    }
    @IBAction func respond(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        saveData()
        guard segue.identifier == "unWindSave" else{return}
//        saveData()
       
    }
}
