//
//  PreviewContactViewController.swift
//  App
//
//  Created by REOF ALMESHARI on 07/09/2022.
//

import UIKit
import Firebase
import FirebaseFirestore


class PreviewContactViewController: UIViewController {
    let db = Firestore.firestore()
    
    
    
    @IBOutlet weak var contactPhone: UILabel!
    @IBOutlet weak var contactFullName: UILabel!
    @IBOutlet weak var contactImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    
    func fetchData(){
        db.collection("contacts").whereField("UID", isEqualTo: Auth.auth().currentUser!.uid ).getDocuments { querySnapshot, error in
            
            guard error == nil else {
                print("Error\(error!.localizedDescription)")
                return
            }
            for doc in querySnapshot!.documents{
                let data = doc.data()
                
                self.contactFullName.text  = (data["FullName"] as! String)
                print((data["FullName"] as! String))
                self.contactPhone.text  = (data["PhoneNumber"] as! String)
                print((data["PhoneNumber"] as! String))
                
            }
        }
    }
    
    
}
