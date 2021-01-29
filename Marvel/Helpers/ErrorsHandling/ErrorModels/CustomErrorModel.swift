//
//  CustomErrorModel.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

class CustomErrorModel: NSError {
    
    var type: String = "Backend"
    var internalCode: String = ""
    var presentationMessage = ""
    var originalObject: Any?
    
    var httpClientError = HTTPClientError(code: -1)
    var backendError = BackendError(code: "", serverMessage: "")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(httpClientError: HTTPClientError.ErrorType, backendError: BackendError.ErrorType) {

        self.httpClientError = HTTPClientError(code: httpClientError.rawValue)
        self.backendError = BackendError(code: backendError.rawValue, serverMessage: "")
        let defaultDomain = "error_generic".localized
        self.presentationMessage = self.backendError.errorText

        super.init(domain: defaultDomain, code: self.httpClientError.type.rawValue, userInfo: nil)

    }
    
    init(data: Data?, httpCode: Int?) {

        self.httpClientError = HTTPClientError(code: httpCode ?? -1)
        
        let defaultDomain = "error_generic".localized
        let defaultCode = self.httpClientError.type.rawValue
        
        guard let data = data else {
            super.init(domain: defaultDomain, code: defaultCode, userInfo: nil)
            self.presentationMessage = defaultDomain
            return
        }
        
        if  let errorLoginModelModel = try? JSONDecoder().decode(ErrorLoginServerModel.self, from: data) {
            
            let errorLoginModel = ErrorLoginModel(serverModel: errorLoginModelModel)
            let domain = errorLoginModel.errorMessage ?? defaultDomain
            super.init(domain: domain,
                       code: defaultCode,
                       userInfo: nil)
            self.presentationMessage = defaultDomain
            self.originalObject = errorLoginModel
            self.internalCode = errorLoginModel.errorCode ?? ""
            
            self.backendError = BackendError(code: errorLoginModel.errorCode ?? "", serverMessage: errorLoginModel.errorMessage ?? "")

            return
        }
        
        super.init(domain: defaultDomain, code: defaultCode, userInfo: nil)
        self.presentationMessage = self.backendError.errorText
    }
}
