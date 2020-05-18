//
//  HttpConfiguration.swift
//  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation

public enum HostUrl: String {
    case develop = "https://mawingu.cbaloop.com/loop/sit/"
    case uat = "https://mawingu.cbaloop.com/loop/uat/"
    case production = "https://loop.co.ke/"
}

public class HttpConfiguration {

    public static let instance = HttpConfiguration()

    #if SIT
        // Available through the "Dev" scheme
        public var host: HostUrl = .develop
    #elseif UAT
        // Available through the "Debug" scheme
        public var host: HostUrl = .uat
    #else
        // Available through the "Release" scheme
        public var host: HostUrl = .production
    #endif

    

    private init() {
       // SessionManager.shared.cbaHost = host.rawValue
    }

    //todo: check if needed, otherwise delete
    private let apiPath = "v1"

    func baseUrl() -> URL {
        return URL(string: "\(self.host.rawValue)")!
    }

    func apiUrl() -> URL {
        return baseUrl()
    }

    func authHeaders(_ OTPCode: String? = nil) -> [String: String] {
        var headers: [String: String] = ["Accept": "application/json"]
       
        return headers
    }

    public func url(forPath path: String) -> URL {
        return URL(string: path, relativeTo: apiUrl())!
    }

}
