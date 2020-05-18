//
//  PillButton.swift
//  CBALoop
//
//  Created by Jarret Hardie on 22/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class PillButton: UIControl {
    
    var text: String? = "Next" {
        didSet {
            label.text = text
        }
    }
    var label = UILabel()

    var buttonColor: UIColor = UIColor.green {
        didSet {
            backgroundColor = buttonColor
        }
    }

    var textColor: UIColor = UIColor.black {
        didSet {
            label.textColor = textColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        backgroundColor = buttonColor
        setContentCompressionResistancePriority(.required, for: .vertical)
        setContentHuggingPriority(.required, for: .vertical)
        
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.font = .cbaLoopRoundedButtonFont()
        label.textColor = textColor
        label.text = text
        
        addSubview(label)
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: -20).isActive = true
        _ = label.leftAnchor.constraint(equalTo: label.rightAnchor)
        _ = label.widthAnchor.constraint(greaterThanOrEqualToConstant: 200)
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.24
        
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .vertical)
        setContentHuggingPriority(.required, for: .vertical)
    }
    
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = ceil(bounds.size.height / 2)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 40)
    }
    
    
    // MARK: - State
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? buttonColor : UIColor.gray
            isUserInteractionEnabled = isEnabled
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
           // backgroundColor = isHighlighted ? buttonColor.darker() : buttonColor
        }
    }
}
