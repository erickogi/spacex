//
//  UILabel+LineHeight.swift
//  CBALoop
//
//  Created by Jarret Hardie on 23/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit
import SwiftyAttributes

extension UILabel {
    
    func setText(_ text: String, lineHeightMultiple: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString = text.withFont(font)
            .withTextColor(textColor)
            .withParagraphStyle(paragraphStyle)
        
        attributedText = attributedString
    }
    
}
