//
//  Bindable.swift
//  CBALoop
//
//  Created by Jarret Hardie on 25/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import Foundation

protocol Bindable {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func didUpdate()
    func didError(_ error: Error)
    func bind()
    
}

