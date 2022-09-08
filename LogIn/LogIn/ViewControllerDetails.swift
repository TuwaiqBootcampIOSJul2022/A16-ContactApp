//
//  ViewControllerDetails.swift
//  LogIn
//
//  Created by Razan Abdullah on 07/09/2022.
//

import UIKit

class ViewControllerDetails: UIViewController {

    var Name:String?
    var Email:String?
    var Phone:String?
    var Image:String?
    @IBOutlet weak var PhoneLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NameLabel.text = Name
        EmailLabel.text = Email
        PhoneLabel.text = Phone
        image.image = UIImage(named: "\(Image)")
        
    }
    

}
