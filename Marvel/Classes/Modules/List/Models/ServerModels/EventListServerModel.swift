//
//  EventListServerModel.swift
//  Marvel
//
//  Created by Guillermo Alcala Gamero on 03/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation

struct EventListServerModel: BaseServerModel {
    let available, returned: Int?
    let collectionURI: String?
    let items: [EventSummaryServerModel]?
}
