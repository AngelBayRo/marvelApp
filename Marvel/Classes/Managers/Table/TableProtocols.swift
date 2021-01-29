//
//  TableProtocols.swift
//  Marvel
//

import Foundation

// Protocol used to the View can communicate with Presenter
protocol TablePresenterProtocol: class {
    
    var tablePresenterDelegate: TablePresenterDelegate? { get set }
    
    func numberOfCells(_ tableType: TableType, section: Int) -> Int
    func object(_ tableType: TableType, indexPath: IndexPath) -> Any
    func didTapRow(_ tableType: TableType, indexPath: IndexPath)
    func heightForRow(_ tableType: TableType, indexPath: IndexPath) -> Int
    func loadMoreHeroes(_ tableType: TableType, indexPath: IndexPath)
}

extension TablePresenterProtocol {
    
    func didTapRow(_ tableType: TableType, indexPath: IndexPath) {}
    func heightForRow(_ tableType: TableType, indexPath: IndexPath) -> Int { return 44 }
}

protocol TablePresenterDelegate: class {
    func dataSourceUpdated(_ tableType: TableType)
}
