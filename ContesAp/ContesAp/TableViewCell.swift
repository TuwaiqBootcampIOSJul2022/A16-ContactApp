//
//  TableViewCell.swift
//  ContesAp
//
//  Created by Hessa on 12/02/1444 AH.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var named: UILabel!
    
    @IBOutlet weak var lastname: UILabel!
    
func setupcell(firstname: String){
        named.text = firstname
//        lastname.text = lastnam
        }
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
