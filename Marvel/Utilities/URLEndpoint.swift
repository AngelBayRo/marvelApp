//
//  URLEndpoint.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

struct URLEndpoint {
    
    #if LOC
     static let environementDefault: Environment = Environment.LOC
     #elseif DEV
     static let environementDefault: Environment = Environment.DEV
     #elseif PRE
     static let environementDefault: Environment = Environment.PRE
     #else
     static let environementDefault: Environment = Environment.PRO
     #endif
    
    public enum BaseURLContext {
        case backend
    }
        
    static var login = "characters"
    static var characters = "characters"

}

extension URLEndpoint {
    static func getBaseUrl(urlContext: BaseURLContext) -> String {
        switch urlContext {
        case .backend:
            switch self.environementDefault {
            case .LOC:
                return "https://gateway.marvel.com:443"
            case .DEV:
                return "https://gateway.marvel.com:443"
            case .PRE:
                return "https://gateway.marvel.com"
            case .PRO:
                return "https://gateway.marvel.com"
            }
        }
    }
    
    static func getHash(urlContext: BaseURLContext) -> String {
        switch urlContext {
        case .backend:
            switch self.environementDefault {
            case .LOC:
                return "bc28315dc426b351fe8ad40b2b7eabdb"
            case .DEV:
                return "bc28315dc426b351fe8ad40b2b7eabdb"
            case .PRE:
                return "bc28315dc426b351fe8ad40b2b7eabdb"
            case .PRO:
                return "bc28315dc426b351fe8ad40b2b7eabdb"
            }
        }
    }
    
    static func getApiKey(urlContext: BaseURLContext) -> String {
        switch urlContext {
        case .backend:
            switch self.environementDefault {
            case .LOC:
                return "3838a06eef056baaa92ac72341864dce"
            case .DEV:
                return "3838a06eef056baaa92ac72341864dce"
            case .PRE:
                return "3838a06eef056baaa92ac72341864dce"
            case .PRO:
                return "3838a06eef056baaa92ac72341864dce"
            }
        }
    }
    
    static func getTimestamp(urlContext: BaseURLContext) -> String {
        switch urlContext {
        case .backend:
            switch self.environementDefault {
            case .LOC:
                return "9"
            case .DEV:
                return "9"
            case .PRE:
                return "9"
            case .PRO:
                return "9"
            }
        }
    }
    
    static func getVersion(urlContext: BaseURLContext) -> String {
        
        switch urlContext {
        case .backend:
            switch self.environementDefault {
            case .LOC:
                return "v1"
            case .DEV:
                return "v1"
            case .PRE:
                return "v1"
            case .PRO:
                return "v1"
            }
        }
    }
    
    static func buildURL(urlContext: BaseURLContext, endpoint: String) -> String {
        switch urlContext {
        case .backend:
            return getBaseUrl(urlContext: urlContext) + "/" + getVersion(urlContext: urlContext) + "/public" + "/\(endpoint)" + "?apikey=\(getApiKey(urlContext: urlContext))&ts=\(getTimestamp(urlContext: urlContext))&hash=\(getHash(urlContext: urlContext))"
        }
    }
}
