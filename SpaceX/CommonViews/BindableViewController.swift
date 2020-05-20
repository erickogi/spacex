//
//  BindableViewController.swift
//  CBALoop
//
//  Created by Jarret Hardie on 26/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class BindableViewController<T: ViewControllerModel>: UIViewController, Bindable {    
    
    var viewModel: T! {
        didSet {
            bind()
        }
    }
    
    deinit {
        viewModel.didUpdate = nil
        viewModel.didError = nil
    }
    
    // MARK: - Bindable
    
    func didUpdate() {
        
    }
    
    func didError(_ error: Error) {
        
    }
    
    func bind() {
        viewModel.didUpdate = { [weak self] in
            self?.didUpdate()
        }
        
        viewModel.didError = { [weak self] error in
            self?.didError(error)
        }
    }
}
