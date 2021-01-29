//
//  GlobalPositionRouter.swift
//  Marvel
//

import Foundation

protocol ListRouterProtocol: BaseRouterProtocol {
    func goToDetail(element: CharacterViewModel)
}

final class ListRouter: BaseRouter {
    
    weak var view: ListViewController? {
        return super.baseView as? ListViewController
    }    
}

extension ListRouter: ListRouterProtocol {
    func goToDetail(element: CharacterViewModel) {
        
    }
}
