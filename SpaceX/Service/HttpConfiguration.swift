//
//  HttpConfiguration.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation

public enum HostUrl: String {
    case production = "https://api.spacexdata.com/v3/"
    case nasa = "https://api.nasa.gov/"
}

public class HttpConfiguration {

    public static let instance = HttpConfiguration()

        public var host: HostUrl = .production
        public var nasa: HostUrl = .nasa

    

    private init() {
       // SessionManager.shared.cbaHost = host.rawValue
    }

   
    func baseUrl() -> URL {
        return URL(string: "\(self.host.rawValue)")!
    }

    func baseNasaUrl() -> URL {
        return URL(string: "\(self.nasa.rawValue)")!
    }
    
    func apiUrl() -> URL {
        return baseUrl()
    }
    
    func nasaUrl()->URL{
        return baseNasaUrl()
    }

    func authHeaders(_ OTPCode: String? = nil) -> [String: String] {
        var headers: [String: String] = ["Accept": "application/json"]
       
        return headers
    }

    public func url(forPath path: String) -> URL {
        return URL(string: path, relativeTo: apiUrl())!
    }

}
