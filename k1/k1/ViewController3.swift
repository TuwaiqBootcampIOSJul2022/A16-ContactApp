//
//  ViewController3.swift
//  k1
//
//  Created by sarahAldosari on 11/02/1444 AH.
//


import UIKit
import FirebaseCore
import FirebaseFirestore
class ViewController3: UIViewController {
    let db = Firestore.firestore()
    
    
    @IBOutlet weak var AddNewAddress: UITextField!
    @IBOutlet weak var AddnewName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Addname(_ sender: Any) {
        saveData()
    }
    func saveData(){
        db.collection("Names").addDocument(data: ["name":self.AddnewName.text!,"phone":self.AddNewAddress.text!]) {error in
            if let e = error{
                print(e.localizedDescription)

            }else{
                print("Data Saved   ")

            }

}
    }
}
