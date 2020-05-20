//
//  VehiclesWorkflow.swift
//  SpaceX
//
//  Created by Admin on 19/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import UIKit

class VehiclesWorkflow: Workflow {

    
    var subWorkflow: Workflow?
    var parentWorkflow: Workflow?
    
    lazy var primaryViewController: UIViewController = {
        let controller = UIStoryboard.vehiclesViewController() as! VehiclesViewController
               controller.viewModel = VehiclesViewModel()

        return controller
    }()

    func reset() {
        if let vehiclesViewController = primaryViewController as? VehiclesViewController {
            vehiclesViewController.reset()
        }
    }

    func unwind() {
        primaryViewController.navigationController?.popToViewController(primaryViewController, animated: true)
    }


}
