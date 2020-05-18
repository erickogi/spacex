//
//  CoreAPIUrl.swift
///  SpaceX
//
//  Created by Admin on 18/05/2020.
//  Copyright © 2020 Kogi. All rights reserved.
//

import Alamofire

enum CoreAPIUrl: String {
    //Launches
    case next = "launches/next"
    
    private func dateFormatter() -> DateFormatter? {
      
            return SpaceXDate.apiShortYear.formatter

    }

    func completeUrl() -> URL {
        return URL(string: self.rawValue, relativeTo: HttpConfiguration.instance.apiUrl())!
    }

    public func request<T: Decodable>(with params: Parameters? = nil, method: HTTPMethod = .post, OTPCode: String? = nil, completion: @escaping (Result<T>) -> Void) {
        let address = self.completeUrl().absoluteString
        let headers = HttpConfiguration.instance.authHeaders(OTPCode)
        let encoding: ParameterEncoding = method == .get ? URLEncoding.default : JSONEncoding.default

        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120

        manager.request(address, method: method, parameters: params, encoding: encoding, headers: headers).responseData(completionHandler: { r in
           
            self.handleResponse(r, isOTP: false, completion: completion)
        })
    }

    public func handleResponse<T: Decodable>(_ response: DataResponse<Data>, isOTP: Bool, completion: @escaping (Result<T>) -> Void) {
        guard let data = response.data else {
            let error = CoreError.otherError("The server response contains no data.")
            completion(Result.failure(error))
            return
        }
        guard let code = response.response?.statusCode, code != 401 else {
            let error = CoreError.unauthorized("Unable to perform the requested action - the account is unauthorized.")
            completion(Result.failure(error))
            return
        }
      
        

        let decoder = JSONDecoder()
        if let formatter = self.dateFormatter() {
            decoder.dateDecodingStrategy = .formatted(formatter)
        }

        do {
            let obj: T = try decoder.decode(T.self, from: data)
//            guard obj.code == 0 else {
//                if obj.code >= 5500, obj.code <= 5501, isOTP {
//                    throw CoreError.otpError(nil)
//                } else {
//                    throw CoreError.apiError(obj.code, obj.message)
//                }
//            }
            completion(Result.success(obj))
        } catch let error as DecodingError {
            var errorToReport = CoreError.otherError(error.localizedDescription)
            #if DEV
                switch error {
                case .dataCorrupted(let context):
                    let details = context.underlyingError?.localizedDescription ?? context.codingPath.map { $0.stringValue }.joined(separator: ".")
                    errorToReport = CoreError.otherError("\(context.debugDescription) - (\(details))")
                case .keyNotFound(let key, let context):
                    let details = context.underlyingError?.localizedDescription ?? context.codingPath.map { $0.stringValue }.joined(separator: ".")
                    errorToReport = CoreError.otherError("\(context.debugDescription) (key: \(key), \(details))")
                case .typeMismatch(let type, let context), .valueNotFound(let type, let context):
                    let details = context.underlyingError?.localizedDescription ?? context.codingPath.map { $0.stringValue }.joined(separator: ".")
                    errorToReport = CoreError.otherError("\(context.debugDescription) (type: \(type), \(details))")
                @unknown default:
                    break
            }
                completion(Result.failure(errorToReport))
            #else
                completion(Result.failure(CoreError.validation("Sorry, something went wrong. Please try again.")))
            #endif
        } catch let error {
            
            completion(Result.failure(error))
        }
    }

}
