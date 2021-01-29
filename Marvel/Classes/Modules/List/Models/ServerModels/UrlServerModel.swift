//
//  UrlServerModel.swift
//  Marvel
//
//  Created by Guillermo Alcala Gamero on 03/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation

struct UrlServerModel: BaseServerModel {
    let type: URLType?
    let url: String?
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}
