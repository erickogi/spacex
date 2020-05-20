//
//  VehiclesViewController.swift
//  SpaceX
//
//  Created by Admin on 19/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import UIKit

class VehiclesViewController:  BindableViewController<VehiclesViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var viewModel: VehiclesViewModel! {
        didSet {
            tabBarItem = UITabBarItem(title: viewModel.tabBarTitle,
                                      image: UIImage(named: viewModel.tabBarInactiveIconName),
                                      selectedImage: UIImage(named: viewModel.tabBarActiveIconName))
            bind()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func reset() {
       
    }
}
