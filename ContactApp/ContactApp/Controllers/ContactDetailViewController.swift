//
//  ContactDetailViewController.swift
//  ContactApp
//
//  Created by Rashed Shrahili on 12/02/1444 AH.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var messageContact: UIButton!
    @IBOutlet weak var callContact: UIButton!
    @IBOutlet weak var videoContact: UIButton!
    @IBOutlet weak var emailContact: UIButton!
    @IBOutlet weak var mobileInfoView: UIView!
    @IBOutlet weak var phoneContact: UIButton!
    
    //MARK: - Variables
    var fullName:String?
    var phoneNumber:String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        contactImageView.layer.cornerRadius = contactImageView.layer.frame.height / 2
        messageContact.layer.cornerRadius = 8
        callContact.layer.cornerRadius = 8
        videoContact.layer.cornerRadius = 8
        emailContact.layer.cornerRadius = 8
        mobileInfoView.layer.cornerRadius = 8
        
        contactNameLabel.text = fullName
        phoneContact.setTitle(phoneNumber, for: .normal)
    }
    
    
    
}
