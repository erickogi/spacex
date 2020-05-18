//
//  LoopResponse.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation
public protocol SpaceXResponse {
    var code: Int { get }
    var message: String { get }
}
