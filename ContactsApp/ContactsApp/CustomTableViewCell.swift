//
//  CustomTableViewCell.swift
//  ContactsApp
//
//  Created by Waad on 11/02/1444 AH.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
