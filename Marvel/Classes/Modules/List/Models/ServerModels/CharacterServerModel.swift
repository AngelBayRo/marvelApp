//
//  CharacterServerModel.swift
//  Marvel
//
//  Created by Guillermo Alcala Gamero on 03/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation

struct CharacterServerModel: BaseServerModel {
    let id: Int?
    let name, description: String?
    let modified: String?
    let resourceURI: String?
    let urls: [UrlServerModel]?
    let thumbnail: ImageServerModel?
    let comics: ComicListServerModel?
    let stories: StoryListServerModel?
    let events: EventListServerModel?
    let series: SeriesListServerModel?
}
