//
//  ContactCellTableViewCell.swift
//  Contacts
//
//  Created by Maan Abdullah on 07/09/2022.
//

import UIKit

class ContactCellTableViewCell: UITableViewCell {
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
