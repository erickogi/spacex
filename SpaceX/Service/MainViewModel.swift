//
//  MainViewModel.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation

class MainViewModel: ViewControllerModel , LoadingStateDisplayer {
    var title: String = ""
    
    var didUpdate: (() -> Void)?
    
    var didError: ((Error) -> Void)?
    
    var nextLaunch : Next?
    func fetchNextLaunch(){
        LaunchServiceImpl.next(){[weak self] (result) in
            guard let strongSelf = self else {return}
            
            switch result{
            case.success(let value):
                self?.nextLaunch = value
            case .failure(_):
                self?.didError
            }
        }
    }
}
