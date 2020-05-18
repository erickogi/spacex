//
//  LoadingStateDisplayer.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation
import UIKit

public protocol LoadingStateDisplayer {
    func updateLoadState(isLoading: Bool, completion: (() -> Void)?)
}

public extension LoadingStateDisplayer where Self: UIViewController {
    func updateLoadState(isLoading: Bool, completion: (() -> Void)?) {
        if isLoading {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        else {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

extension LoadingStateDisplayer where Self: ViewControllerModel {
    func updateLoadState(isLoading: Bool, completion: (() -> Void)?) {
        if isLoading {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        else {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

//extension LoadingStateDisplayer where Self: Workflow {
//    func updateLoadState(isLoading: Bool, completion: (() -> Void)?) {
//        if isLoading {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        }
//        else {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        }
//    }
//}
