//
//  ListAssembly.swift
//  Marvel
//

import Foundation
import UIKit

final class ListAssembly: BaseAssembly {
    
    static func listView(listAssemblyDTO: ListAssemblyDTO? = nil) -> ListViewController {
        let view = ListViewController(nibName: Utils.getXib(xibFile: .listView), bundle: nil)
        
        let viper =  BaseAssembly.assembly(baseView: view,
                                           presenter: ListPresenter.self,
                                           router: ListRouter.self,
                                           interactor: ListInteractor.self)
        
        viper.interactor.listAssemblyDTO = listAssemblyDTO
        
        viper.interactor.provider = DataAssembly.listProvider(interactor: viper.interactor)
        
        return view
    }
}

//Struct that represents the transfer object of GlobalPosition
struct ListAssemblyDTO {
    
}
