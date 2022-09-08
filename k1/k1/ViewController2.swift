//
//  ViewController2.swift
//  k1
//
//  Created by sarahAldosari on 11/02/1444 AH.
//

import UIKit

class ViewController2: UIViewController {
var name = ""
    var num = ""
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var Adress: UILabel!
    @IBOutlet weak var Adress2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       print(num)
        print(name)
        infoName.text = name
        Adress.text = num
    }
    @IBOutlet weak var infoName: UILabel!
    

    
}
