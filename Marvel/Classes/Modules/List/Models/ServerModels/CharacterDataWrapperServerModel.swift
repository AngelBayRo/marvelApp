//
//  CharacterDataWrapperServerModel.swift
//  Marvel
//
//  Created by Guillermo Alcala Gamero on 03/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation

struct CharacterDataWrapperServerModel: BaseServerModel {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let data: CharacterDataContainerServerModel?
    let etag: String?
}
