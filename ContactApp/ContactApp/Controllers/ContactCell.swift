//
//  ContactCell.swift
//  ContactApp
//
//  Created by Rashed Shrahili on 12/02/1444 AH.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var contactNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
