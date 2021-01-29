//
//  CharacterBusinessModel.swift
//  Marvel
//
//  Created by Guillermo Alcala Gamero on 03/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation

class CharacterBusinessModel: BaseBusinessModel {
    
    var name, description, imageURL: String?
    
    required init(serverModel: BaseServerModel?) {
        super.init(serverModel: serverModel)
        
        guard let serverModel = serverModel as? CharacterServerModel else { return }
        
        self.name = serverModel.name
        self.description = serverModel.description
        
        if let thumbnail = serverModel.thumbnail, let path = thumbnail.path, let ext = thumbnail.thumbnailExtension {
            let httpsPath = path.replacingOccurrences(of: "http", with: "https")
            self.imageURL = "\(httpsPath)/standard_medium.\(ext)"
        }
    }
}
