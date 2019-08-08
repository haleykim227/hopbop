//
//  EventRankingCell.swift
//  hop&bop
//
//  Created by Amy Sywe on 8/1/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import UIKit

class EventRankingCell: UITableViewCell {

    @IBOutlet weak var eventIDLabel: UILabel!
    var eventID: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //eventIDLabel.text = eventID
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
