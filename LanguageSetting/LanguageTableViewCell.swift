//
//  LanguaueTableViewCell.swift
//  LanguageSetting
//
//  Created by Lullaby on 6/2/2561 BE.
//  Copyright © 2561 Lullaby. All rights reserved.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var checkBoxImage: UIImageView!
    @IBOutlet weak var languaguLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
