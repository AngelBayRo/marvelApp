//
//  CharacterTableViewCellDrawer.swift
//  Marvel
//

import Foundation
import UIKit

class CharacterTableViewCellDrawer {
    
    static func cell(model: CharacterViewModel, tableView: UITableView, presenter: Any?) -> UITableViewCell {
        
        guard let cell = BaseTableViewCell<Any>.createBaseCell(tableView: tableView, cell: CharacterTableViewCell.self, cellName: "CharacterTableViewCell", model: model) else { return UITableViewCell() }
        
        return cell
    }
}
