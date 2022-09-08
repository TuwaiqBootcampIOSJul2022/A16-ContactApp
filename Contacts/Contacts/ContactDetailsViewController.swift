//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by NosaibahMW on 11/02/1444 AH.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    var contact:Conact?
    
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactPhoneNumber: UILabel!
    @IBOutlet weak var contactEmail: UILabel!
    
    @IBOutlet weak var firstSubView: UIView!
    @IBOutlet weak var secondSubView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contactName.text = contact?.name
        contactPhoneNumber.text = contact?.phoneNumber
        contactEmail.text = contact?.email
        
        firstSubView.layer.cornerRadius = 15
        secondSubView.layer.cornerRadius = 15
    }
    

}
