//
//  PositiveButton.swift
//  CBALoop
//
//  Created by Artur Friesen on 19.12.17.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class PositiveButton: BaseButton {

    override func setup() {
        super.setup()
        backgroundColor = UIColor.green
        setTitleColor(UIColor.white, for: .normal)
    }
}
