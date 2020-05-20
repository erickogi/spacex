//
//  ViewController.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController, NavigationControllerRoot {

var viewModel: MainViewModel!

override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
}
    
        override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupTitle()

        title = "viewModel.title"

      
        let font = UIFont(name: "GothamRounded-Medium", size: 11.0) ?? UIFont.systemFont(ofSize: 11.0, weight: .medium)
        if let items = tabBar.items {
            for item in items {
                item.setTitleTextAttributes([.font: font], for: .normal)
            }
        }
    }

   override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          navigationController?.setNavigationBarHidden(true, animated: animated)
  
      }
    
    private func setupAppearance() {
        let font =  UIFont.systemFont(ofSize: 16.0)
        let attributes: Dictionary<NSAttributedString.Key, Any> = [.font: font, .foregroundColor: UIColor.white]

        UINavigationBar.appearance().titleTextAttributes = attributes
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
    }

    private func setupTitle() {
        let image = UIImage(named: "icLogoInverse")
        let view = UIImageView(image: image)
        navigationItem.titleView = view
    }

}

