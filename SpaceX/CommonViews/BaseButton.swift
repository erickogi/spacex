//
//  BaseButton.swift
//  CBALoop
//
//  Created by Artur Friesen on 19.12.17.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

@IBDesignable
class BaseButton: UIButton {
    
    private let intrinsicButtonHeight: CGFloat = 44.0
    private let padding: CGFloat = 10.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup() {
        //titleLabel?.font = UIFont.cbaLoopRoundedButtonFont()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2.0
    }
    
    override var intrinsicContentSize: CGSize {
        guard let titleLabel = titleLabel else {
            return CGSize(width: UIView.noIntrinsicMetric, height: intrinsicButtonHeight)
        }
        
        let labelWidth = titleLabel.intrinsicContentSize.width
        let buttonWidth = labelWidth + padding * 2
        return CGSize(width: buttonWidth, height: intrinsicButtonHeight)
    }
}
