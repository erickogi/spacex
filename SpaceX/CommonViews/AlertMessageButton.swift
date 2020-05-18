//
//  DefaultButton.swift
//  CBALoop
//
//  Created by Normann Joseph on 08.12.17.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class AlertMessageButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
       // titleLabel?.font = UIFont.cbaLoopRoundedButtonFont()
        layer.cornerRadius = self.frame.height / 2
        layer.backgroundColor = UIColor.green as! CGColor
        clipsToBounds = true;
    }

}
