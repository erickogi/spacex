//
//  CoreError.swift
///  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Foundation

public enum CoreError: Error {

    case validation(String?)
    case jsonParseError(String?)
    case apiError(Int, String?)
    case noNetwork
    case otpError(String?)
    case otherError(String?)
    case unauthorized(String?)
    case sessionExpired(String?)
}

extension CoreError: LocalizedError {

    public var errorDescription: String? {

        switch self {
        case .validation(let desc):
            return desc ?? "There was a validation error"
        case .jsonParseError(let desc):
            return desc ?? "There was a json parsing error"
        case .apiError(_, let desc):
            if let errorDesc = desc {
                return errorDesc
            }
            return "There was a server error"
        case .otherError(let desc):
            if let errorDesc = desc {
                return String(describing: errorDesc)
            }
            return "An error occured"
        case .unauthorized(let desc):
            if let errorDesc = desc {
                return String(describing: errorDesc)
            }
            return "Unauthorized"
        case .sessionExpired(let desc):
            if let errorDesc = desc {
                return String(describing: errorDesc)
            }
            return "Session expired"
        case .noNetwork:
            return "Could not connect to the network. Please check and try again."
       
        case .otpError(_):
            return ""
        }
    }
}

