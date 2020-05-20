//
//  ViewModel.swift
//  CBALoop
//
//  Created by Jarret Hardie on 25/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import Foundation

protocol ViewModel: AnyObject {
    
    var didUpdate: (() -> Void)? { get set }
    var didError: ((Error) -> Void)? { get set }
    var didClearError: (() -> Void)? { get set }
}
