//
//  UILabel+Style.swift
//  CBALoop
//
//  Created by Jarret Hardie on 24/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

extension UILabel {
    
    static func styled(_ font: UIFont?, _ color: UIColor, _ alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.textColor = color
        label.textAlignment = alignment
        
        return label
    }
    
}
