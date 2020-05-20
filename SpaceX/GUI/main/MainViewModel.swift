//
//  MainViewModel.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation

class MainViewModel: ViewControllerModel {
    var title: String = ""
    
    var didUpdate: (() -> Void)?
    
    var didError: ((Error) -> Void)?
    
  
    
   
}

