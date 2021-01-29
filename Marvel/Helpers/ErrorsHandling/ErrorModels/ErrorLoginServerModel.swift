//
//  ErrorLoginServerModel.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation

struct ErrorLoginServerModel: BaseServerModel {
    
    let errorCode: String?
    let errorMessage: String?
    let remainingAttempts: Int?
}
