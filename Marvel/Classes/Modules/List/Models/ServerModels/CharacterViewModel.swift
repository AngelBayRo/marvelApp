//
//  CharacterViewModel.swift
//  Marvel
//
//  Created by Guillermo Alcala Gamero on 03/03/2020.
//  Copyright © 2020 Alfonso Miranda Castro. All rights reserved.
//

import Foundation
import UIKit

class CharacterViewModel: BaseViewModel {
    
    var name, description, imageURL: String?
    
    required init(businessModel: BaseBusinessModel?) {
        super.init(businessModel: businessModel)
        
        guard let businessModel = businessModel as? CharacterBusinessModel else { return }
        
        self.name = businessModel.name
        self.description = businessModel.description
        self.imageURL = businessModel.imageURL
    }

}
