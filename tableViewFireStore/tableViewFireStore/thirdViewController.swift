//
//  thirdViewController.swift
//  tableViewFireStore
//
//  Created by Faisal Almutairi on 11/02/1444 AH.
//

import UIKit
import Firebase
import FirebaseFirestore
class thirdViewController: UIViewController {

    @IBOutlet weak var phoneNumberDataBase: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var lastNameDataBase: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameDataBase: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    
    let db = Firestore.firestore()
    var arrayInfo :[[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstView.layer.cornerRadius = 16
        secondView.layer.cornerRadius = 16
        thirdView.layer.cornerRadius = 16
    }
    
    
    func readData(){
        db.collection("users").getDocuments { querySnapshot, error in
            
            for i in querySnapshot!.documents{
                let data = i.data()
                print(data["FirstName"] as? String)
                self.arrayInfo.append(data)
                
            }
        }
    }

}
