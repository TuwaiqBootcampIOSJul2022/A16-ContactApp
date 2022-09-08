//
//  ViewController3.swift
//  ContesAp
//
//  Created by Hessa on 12/02/1444 AH.
//

import UIKit

class ViewController3: UIViewController {
    
    
    
    @IBOutlet weak var fullname: UILabel!
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var phonenumber: UILabel!
    
    @IBOutlet weak var notetext: UITextView!
    
    
    var contactsdisplay: Contents?
    override func viewDidLoad() {
        super.viewDidLoad()
     
    fullname.text = "Full Name: \((contactsdisplay?.Firstname)!) \((contactsdisplay?.Lastname)!)"
 
        phonenumber.text = "Phone Number: \((contactsdisplay?.phonenumber)!)"
       
        img.image = UIImage(named: "profile")!
        notetext.text = " \((contactsdisplay?.conteactNote)!)"
        
        
    }
    
}
