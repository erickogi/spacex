//
//  NasaService.swift
//  SpaceX
//
//  Created by Admin on 20/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Alamofire

public protocol NasaService {
    static func image(completion: @escaping (Result<NasaImage>) -> Void)
}

public class NasaServiceImpl: NasaService {

    public static func image(completion: @escaping (Result<NasaImage>) -> Void) {
        CoreAPIUrl.nasaImage.request(isNasa: true,method: .get) { (result: Result<NasaImage>) in
             completion(result)
        }
    }
}
