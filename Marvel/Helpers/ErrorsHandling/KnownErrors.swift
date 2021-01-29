//
//  KnownErrors.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

public struct HTTPClientError: Error {
    
    var type: ErrorType = .unknownError
    
    enum ErrorType: Int {
        case internalServerError = 500
        case badGateway = 502
        case unauthorized = 401
        case forbidden = 403
        case notFound = 404
        case preConditionFailed = 412
        case networkError = 0
        case unknownError = -1
    }
    
    init(code: Int) {
        self.type = ErrorType(rawValue: code) ?? .unknownError
    }
}

public struct BackendError: Error {
    
    var type: ErrorType = .unknownError
    var code: String = ""
    var serverMessage = ""
    var errorText = ""
    
    enum ErrorType: String {
        case loginAttempsExceeded = "AUTH0001"
        case userNotFound = "WAM002"
        case invalidUserData = "WAM013"
        case userAlreadyRegistered = "WAM015"
        case tokenInvalid = "AUTH0006"
        case unknownError = ""
    }
    
    init(code: String, serverMessage: String) {
        
        self.type = ErrorType(rawValue: code) ?? .unknownError
        self.errorText = BackendError.getErrorTextFrom(self.type)
        self.serverMessage = serverMessage
    }
    
    static func getErrorTextFrom(_ type: ErrorType) -> String {
    
        switch type {
        case .loginAttempsExceeded:
            return "login_error_blocked_user".localized
        case .userNotFound:
            return "username_forgotten_error_username_not_found".localized
        case .invalidUserData:
            return "username_forgotten_error_username_data_invalid".localized
        case .userAlreadyRegistered:
            return "registration_user_validation_error_user_already_registered".localized
        default:
            return "error_generic".localized
        }
    }
}
