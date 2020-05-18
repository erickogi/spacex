//
//  CustomAlertView.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import UIKit
import SwiftMessages

class CustomAlertView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var doneButton: DefaultButton!

    static let animationDuration = 0.25

    var doneAction: (() -> Void)?

    public func setupView(with title: String, text: String, buttonTitle: String) {
        titleLabel.setText(title, lineHeightMultiple: 1.25)
        textLabel.setText(text, lineHeightMultiple: 1.3)
        
        doneButton.setTitle(buttonTitle, for: .normal)
        layer.cornerRadius = 12.0
    }

    @IBAction func didTapDoneButton(_ sender: Any) {
        fadeOut(completion: { [weak self] _ in
            self?.doneAction?()
        })
    }
}

extension CustomAlertView {
    func fadeIn(duration: TimeInterval = CustomAlertView.animationDuration, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {_ in }) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }

    func fadeOut(duration: TimeInterval = CustomAlertView.animationDuration, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = { _ in }) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
}
