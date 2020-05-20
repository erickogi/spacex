//
//  UIStoryboard+Vehicles.swift
//  SpaceX
//
//  Created by Admin on 19/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func vehiclesViewController() -> VehiclesViewController {
        return viewController("VehiclesViewController", storyboard: "Vehicles") as! VehiclesViewController
    }
    
}
