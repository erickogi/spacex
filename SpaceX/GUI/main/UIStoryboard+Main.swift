//
//  UIStoryboard+Main.swift
//  CBALoop
//
//  Created by Jarret Hardie on 24/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func mainViewController() -> MainViewController {
        return viewController("MainViewController", storyboard: "Main") as! MainViewController
    }
    
}
