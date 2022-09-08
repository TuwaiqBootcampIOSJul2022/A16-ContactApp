//
//  ViewController2.swift
//  Contacts
//
//  Created by Kholoud Almutairi on 11/02/1444 AH.
//

import UIKit

protocol AddContact{
  
    func AddContact (image: String , FName: String , LName : String , PhoneNum : String )
    
}


class ViewController2: UIViewController {
    
    var delegate : AddContact?

    
    @IBOutlet weak var FirstNameTX: UITextField!
    @IBOutlet weak var LastNameTX: UITextField!
    @IBOutlet weak var PhoneNumTX: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func DoneButoon(_ sender: Any) {
        
        if FirstNameTX.text != ""{
                    
            delegate?.AddContact(image: "", FName: FirstNameTX.text! , LName: LastNameTX.text!, PhoneNum: PhoneNumTX.text!)
                    
            UserDefaults.standard.set(try? PropertyListEncoder().encode(contactArray), forKey: "MyData")
            performSegue(withIdentifier: "ddedSegue", sender: nil)


    }
    
}
}
