//
//  MainWorkflow.swift
//  CBALoop
//
//  Created by Jarret Hardie on 24/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class MainWorkflow: Workflow {

    var subWorkflow: Workflow?
    var parentWorkflow: Workflow?
    var mainViewController: MainViewController!

    lazy var primaryViewController: UIViewController = {
       let viewModel = MainViewModel()
        mainViewController = UIStoryboard.mainViewController() 
        mainViewController.viewModel = viewModel
        mainViewController.viewControllers = [homeWorkflow.primaryViewController,vehiclesWorkflow.primaryViewController]
        
        return mainViewController
    }()
    let homeWorkflow = HomeWorkflow()
   let vehiclesWorkflow = VehiclesWorkflow()
    
    func reset() {
        mainViewController?.selectedIndex = 0
        homeWorkflow.reset()
        
    }
 
}
