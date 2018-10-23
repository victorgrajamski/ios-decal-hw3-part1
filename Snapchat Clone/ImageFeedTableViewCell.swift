//
//  ImageFeedTableViewCell.swift
//  Snapchat Clone
//
//  Created by Victor Grajski on 10/22/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class ImageFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
