//
//  NeutralButton.swift
//  CBALoop
//
//  Created by Artur Friesen on 19.12.17.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class NeutralButton: BaseButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func setup() {
        super.setup()
        backgroundColor = UIColor.white
        setTitleColor(UIColor.green, for: .normal)
    }
}
