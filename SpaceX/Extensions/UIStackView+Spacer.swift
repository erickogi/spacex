//
//  UIStackView+Spacer.swift
//  CBALoop
//
//  Created by Jarret Hardie on 24/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func addSpacer(_ size: CGFloat) {
        let spacer = UIView()
        addArrangedSubview(spacer)
    }
    
}
