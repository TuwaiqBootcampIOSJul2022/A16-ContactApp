//
//  TableViewCell.swift
//  k1
//
//  Created by sarahAldosari on 11/02/1444 AH.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var MyTableViewCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var name: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
