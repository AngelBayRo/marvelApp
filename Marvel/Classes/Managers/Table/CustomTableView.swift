//
//  CustomTableView.swift
//  Marvel
//

import Foundation
import UIKit
struct CustomTableView {
    
    var type: TableType
    var tableView: UITableView
    
    init(type: TableType = .unspecified, tableView: UITableView) {
        self.type = type
        self.tableView = tableView
    }
}
