//
//  CustomTableViewCell.swift
//  BeerSampleSwift
//
//  Created by Vinita Miranda on 5/25/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLeadingSpace: NSLayoutConstraint!
    @IBOutlet weak var typeLeadingSpace: NSLayoutConstraint!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
