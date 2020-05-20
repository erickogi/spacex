//
//  UIStoryboard+Home.swift
//  SpaceX
//
//  Created by Admin on 19/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func homeViewController() -> HomeViewController {
        return viewController("HomeViewController", storyboard: "Home") as! HomeViewController
    }
    
}
