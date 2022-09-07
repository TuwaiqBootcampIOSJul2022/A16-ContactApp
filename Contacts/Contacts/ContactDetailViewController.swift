//
//  ContactDetailViewController.swift
//  Contacts
//
//  Created by Maan Abdullah on 07/09/2022.
//

import UIKit
import FirebaseFirestore
class ContactDetailViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var callView: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var mailView: UIView!
    @IBOutlet weak var mobileDetailView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    //MARK: - Variables
    var id = ""
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readData()
        messageView.layer.cornerRadius = 10
        callView.layer.cornerRadius = 10
        videoView.layer.cornerRadius = 10
        mailView.layer.cornerRadius = 10
        mobileDetailView.layer.cornerRadius = 16
        
    }
    
    //MARK: - Methods
    func readData(){
        db.collection("Contact").whereField("id", isEqualTo: id).getDocuments { querySnapshot, error in
            if let err = error {
                print("Error getting documents: \(err)")
            }
            if let firstName = querySnapshot?.documents.first?.data()["firstName"] as? String{
                if let lastName = querySnapshot?.documents.first?.data()["lastName"] as? String{
                    self.nameLabel.text = "\(firstName) \(lastName)"
                }
                else{
                    self.nameLabel.text = firstName
                }
            }
            if let phone = querySnapshot?.documents.first?.data()["phone"] as? String{
                self.phoneLabel.text = phone
                
            }
        }
    }
}
