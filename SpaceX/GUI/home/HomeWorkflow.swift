//
//  HomeWorkflow.swift
//  CBALoop
//
//  Created by Jarret Hardie on 24/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class HomeWorkflow: Workflow {

    
    var subWorkflow: Workflow?
    var parentWorkflow: Workflow?
    
    lazy var primaryViewController: UIViewController = {
        let controller = UIStoryboard.homeViewController() as! HomeViewController
               controller.viewModel = HomeViewModel()

        return controller
    }()

    func reset() {
        if let homeViewController = primaryViewController as? HomeViewController {
            homeViewController.reset()
        }
    }

    func unwind() {
        primaryViewController.navigationController?.popToViewController(primaryViewController, animated: true)
    }


}
