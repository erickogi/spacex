//
//  Result.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Alamofire

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
