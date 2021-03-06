//
//  LaunchService.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Alamofire

public protocol LaunchService {
    static func next(completion: @escaping (Result<Next>) -> Void)
}

public class LaunchServiceImpl: LaunchService {

    public static func next(completion: @escaping (Result<Next>) -> Void) {
      print("static func next")
        CoreAPIUrl.next.request() { (result: Result<Next>) in
             print("CoreAPIUrl.next.request")
            completion(result)
        }

    }
}

