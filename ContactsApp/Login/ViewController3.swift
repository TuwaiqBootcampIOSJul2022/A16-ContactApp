//
//  ViewController3.swift
//  Contacts
//
//  Created by Kholoud Almutairi on 11/02/1444 AH.
//

import UIKit

class ViewController3: UIViewController {
    
    var FName1 = ""
    var LName1  = ""
    var PNum1  = ""

    @IBOutlet weak var ContactImage: UIImageView!
    
    @IBOutlet weak var FirstNameL: UILabel!
    
    @IBOutlet weak var LastNameL: UILabel!
    
    @IBOutlet weak var PhoneNumL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirstNameL.text = FName1
        LastNameL.text = LName1
        PhoneNumL.text = PNum1
        
    }
}
