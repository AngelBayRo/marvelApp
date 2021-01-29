//
//  ErrorLoginModel.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

class ErrorLoginModel: BaseBusinessModel {
    
    var errorCode: String?
    var errorMessage: String?
    var remainingAttempts: Int?
    
    required init(serverModel: BaseServerModel?) {
        super.init(serverModel: serverModel)
        
        guard let serverModel = serverModel as? ErrorLoginServerModel else { return }
        self.errorCode = serverModel.errorCode
        self.errorMessage = serverModel.errorMessage
        self.remainingAttempts = serverModel.remainingAttempts
    }
}
