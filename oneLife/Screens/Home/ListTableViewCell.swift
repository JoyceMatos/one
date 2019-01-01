//
//  ListTableViewCell.swift
//  oneLife
//
//  Created by Joyce Matos on 1/1/19.
//  Copyright © 2019 Joyce Matos. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
