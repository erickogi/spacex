//
//  VehiclesViewModel.swift
//  SpaceX
//
//  Created by Admin on 19/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation

class VehiclesViewModel : ViewControllerModel, LoadingStateDisplayer {

var nextLaunch : Next?
  

var title: String {
    return "Vehicles"
}

var tabBarTitle: String {
    return "Vehicles"
}

var tabBarInactiveIconName: String {
    return "icTabHomeOff"
}

var tabBarActiveIconName: String {
    return "icTabHomeOn"
}


func fetchNextLaunch(){
      LaunchServiceImpl.next(){[weak self] (result) in
      guard let strongSelf = self else {return}
      switch result{
      case.success(let value):
      self?.nextLaunch = value
      self?.didUpdate
      case .failure(let error):
      self?.didError
      }
      }
      }

// MARK: ViewControllerModel methods
var didUpdate: (() -> Void)?
var didError: ((Error) -> Void)?

}
