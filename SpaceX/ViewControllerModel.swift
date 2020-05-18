//
//  ViewControllerModel.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerModel: AnyObject {
    
    var title: String { get }
    var nextButtonTitle: String { get }
    
    var didUpdate: (() -> Void)? { get set }
    var didError: ((Error) -> Void)? { get set }
}

extension ViewControllerModel {

    var nextButtonTitle: String {
        return "NEXT"
    }

    public func alertViewWith(title: String, text: String, buttonTitle: String) -> CustomAlertView {
        let view: CustomAlertView = .fromNib()
        view.setupView(with: title,
                       text: text,
                       buttonTitle: buttonTitle)
        view.titleLabel.textColor = UIColor.green
        view.alpha = 0
        view.isHidden = true
        return view
    }
    
}
