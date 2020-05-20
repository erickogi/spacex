//
//  LaunchInfoCell.swift
//  SpaceX
//
//  Created by Admin on 20/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import UIKit

class LaunchInfoCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var iconView: UIImageView!
    
 override func layoutSubviews() {
     super.layoutSubviews()

//     contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
 }
   
}
