//
//  UIStoryboard+ViewController.swift
//  CBALoop
//
//  Created by Jarret Hardie on 22/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static private func window() -> UIWindow {
        let appDelegate = UIApplication.shared.delegate!
        return (appDelegate.window!)!
    }
    
    static func viewController(_ name: String, storyboard: String) -> UIViewController {
        return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    static func viewController<T>(_ name: String, storyboard: String, model: T) -> BindableViewController<T> {
        let viewController = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: name) as! BindableViewController<T>
        viewController.viewModel = model
        return viewController
    }
    
}
