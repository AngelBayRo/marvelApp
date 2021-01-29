//
//  DetailListAssembly.swift
//  Marvel
//

import Foundation
import UIKit

final class DetailListAssembly: BaseAssembly {
    let view = DetailListViewController(nibName: Utils.getXib(xibFile: .detailListView), bundle: nil)
    
}

//Struct that represents the transfer object of GlobalPosition
struct DetailListAssemblyDTO {
    
    var name, description, imageURL: String?
    
    init(element: CharacterViewModel) {
        self.name = element.name
        self.description = element.description
        self.imageURL = element.imageURL
    }
}
