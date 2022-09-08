//
//  fourViewController.swift
//  testForAuth
//
//  Created by Ruba on 12/02/1444 AH.
//

import UIKit

class fourViewController: UIViewController {

    var fname:String?
    var lname:String?
    var pn:String?

    @IBOutlet weak var phoneN: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var firstN: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        firstN.text = fname
        lastName.text = lname
        phoneN.text = pn
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

