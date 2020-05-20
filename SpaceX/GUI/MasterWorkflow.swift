//
//  MasterWorkflow.swift
//  CBALoop
//
//  Created by Jarret Hardie on 22/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class MasterWorkflow {
    
      var window: UIWindow
    var masterNavigationController: NavigationController
    let mainWorkflow = MainWorkflow()
    init(with window: UIWindow) {
          self.window = window
          self.masterNavigationController = NavigationController(rootViewController: mainWorkflow.primaryViewController)
          masterNavigationController.modalTransitionStyle = .crossDissolve
          self.window.rootViewController = masterNavigationController
          
    }
//UIStoryboard.vehiclesViewController()
//  if let windowScene = scene as? UIWindowScene {
//         let window = UIWindow(windowScene: windowScene)
//         window.rootViewController = UIHostingController(rootView: ContentView(coordinator:coord, model:store))
//         self.window = window
//         window.makeKeyAndVisible()
//     }

    func switchWorkflow(to workflow: Workflow) {
        masterNavigationController.popToRootViewController(animated: false)
        masterNavigationController.cancelProgress()
        masterNavigationController.replaceRootViewController(with: workflow.primaryViewController, animated: true)
    }
    
}
