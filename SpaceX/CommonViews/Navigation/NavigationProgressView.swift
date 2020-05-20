//
//  NavigationProgressView.swift
//  CBALoop
//
//  Created by Jarret Hardie on 24/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

// adapted from: https://github.com/ykyouhei/KYNavigationProgress

class NavigationProgressView: UIView {
    
    var progress: Float = 0 {
        didSet {
            progress = min(1, progress)
            barWidthConstraint.constant = bounds.width * CGFloat(progress)
        }
    }
    
    let bar = UIView()
    
    var progressTintColor: UIColor? = UIColor.green {
        didSet {
            bar.backgroundColor = progressTintColor
        }
    }
    
    var trackTintColor: UIColor? = UIColor.green {
        didSet {
            backgroundColor = trackTintColor
        }
    }
    
    fileprivate let barWidthConstraint: NSLayoutConstraint
    
    override var frame: CGRect {
        didSet {
            let tmpProgress = progress
            progress = tmpProgress
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        barWidthConstraint = NSLayoutConstraint(
            item: bar,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: frame.width * CGFloat(progress))
        
        super.init(frame: frame)
        
        let leftConstraint = NSLayoutConstraint(
            item: bar,
            attribute: .left,
            relatedBy: .equal,
            toItem: self,
            attribute: .left,
            multiplier: 1,
            constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(
            item: bar,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1,
            constant: 0)
        
        let topConstraint = NSLayoutConstraint(
            item: bar,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1,
            constant: 0)
        
        addSubview(bar)
        
        backgroundColor = trackTintColor
        
        bar.backgroundColor = progressTintColor
        bar.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            barWidthConstraint,
            leftConstraint,
            topConstraint,
            bottomConstraint])
    }

    func setProgress(_ progress: Float, animated: Bool) {
        let duration: TimeInterval = animated ? 0.1 : 0
        
        self.progress = progress
        
        UIView.animate(withDuration: duration, animations: {
            self.layoutIfNeeded()
        })
    }
    
}

