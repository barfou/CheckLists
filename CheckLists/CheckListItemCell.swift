//
//  CheckListItemCell.swift
//  CheckLists
//
//  Created by lpiem on 23/01/2020.
//  Copyright © 2020 lpiem. All rights reserved.
//

import UIKit

class CheckListItemCell: UITableViewCell {

    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var lblChecked: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
