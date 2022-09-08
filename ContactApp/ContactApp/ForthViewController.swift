//
//  ForthViewController.swift
//  ContactApp
//
//  Created by user on 11/02/1444 AH.
//

import UIKit
import Firebase

class ForthViewController: UIViewController {
    let db = Firestore.firestore()
    var array : [String] = []
    
    @IBOutlet weak var nameLabelTabel: UILabel!
    
    @IBOutlet weak var PhoneLabelDB: UILabel!
   var name1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabelTabel.text = name1
        
        redData()
        // Do any additional setup after loading the view.
    }
    
    
    func redData(){

        self.db.collection("information").getDocuments { querySnapshot , error in
                guard error == nil else{
                    print("Error\(error!.localizedDescription)")
                               return
                    }

            for doc in querySnapshot!.documents {
                let data = doc.data()
                self.PhoneLabelDB.text = (data["phoneUser"] as! String)
                print((data["phoneUser"] as! String))

            }

                }
    }
    
    
    

}
