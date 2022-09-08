//
//  ShowDetailsViewController.swift
//  ContactsApp
//
//  Created by Waad on 12/02/1444 AH.
//

import UIKit

class ShowDetailsViewController: UIViewController {

    var number : String = ""
    var name : String = ""
    
    @IBOutlet weak var showNameLabel: UILabel!
   
    @IBOutlet weak var ShowphoneLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getVale() {
        showNameLabel.text = name
        ShowphoneLabel.text = number
        
        
    }
}
