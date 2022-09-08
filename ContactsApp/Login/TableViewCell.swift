//
//  TableViewCell.swift
//  Contacts
//
//  Created by Kholoud Almutairi on 11/02/1444 AH.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var NlameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
