//
//  Workflow.swift
//  CBALoop
//
//  Created by Jarret Hardie on 22/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

protocol WorkflowFinishable where Self: UIViewController {
    var finishWorkflow: (() -> Void)? { get set }
}

protocol Workflow: class {

    var primaryViewController: UIViewController { get }
    var subWorkflow: Workflow? { get set }
    var parentWorkflow: Workflow? { get set }

    func proceed(to: Workflow, animated: Bool)
    func proceed(to: Workflow, animated: Bool, configure: ((UIViewController) -> Void)?)
    func proceed(to destination: UIViewController)
    func proceed(to destination: UIViewController, usingTransitioningDelegate transitioningDelegate: UIViewControllerTransitioningDelegate)
    func finish()
    
}

extension Workflow {
    
    func proceed(to destination: Workflow, animated: Bool = true) {
        proceed(to: destination, animated: animated, configure: nil)
    }
    
    func proceed(to destination: Workflow, animated: Bool, configure: ((UIViewController) -> Void)?) {
        subWorkflow = destination
        destination.parentWorkflow = self
        let viewController = destination.primaryViewController
        configure?(viewController)
        primaryViewController.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func proceed(to destination: UIViewController) {
        primaryViewController.navigationController?.pushViewController(destination, animated: true)
    }

    func proceed(to destination: UIViewController, usingTransitioningDelegate transitioningDelegate: UIViewControllerTransitioningDelegate) {
        destination.modalPresentationStyle = .custom
        destination.transitioningDelegate = transitioningDelegate
        primaryViewController.navigationController?.topViewController?.present(destination, animated: true)
    }

    func finish() {
        parentWorkflow?.subWorkflow = nil
    }
    
}
