//
//  ListInteractor.swift
//  Marvel
//

import Foundation

protocol ListInteractorInputProtocol: BaseInteractorInputProtocol {
    var listAssemblyDTO: ListAssemblyDTO? { get set }
    func getCharacters()
    func getMoreCharacters(limit: Int)
}

class ListInteractor: BaseInteractor {
    
    // MARK: VIPER Dependencies
    weak var presenter: ListInteractorOutputProtocol? { return super.basePresenter as? ListInteractorOutputProtocol }  
    
    var listAssemblyDTO: ListAssemblyDTO?
    var provider: ListProviderProtocol?
}

extension ListInteractor: ListInteractorInputProtocol {
    
    func getCharacters() {
        
        self.provider?.getCharacthers(
            dto: CharactersDTO(),
            success: { serverModel in
                                
                let businessModel = BaseInteractor.parseArrayToBusinessModel(parserModel: [CharacterBusinessModel].self, arrayServerModels: serverModel?.data?.results)
                
                self.presenter?.getCharactersSuccess(businessModel: businessModel)
                
        }, failure: { error in
            self.presenter?.getCharactersFailure(error: error)
        })
        
    }
    
    func getMoreCharacters(limit: Int) {
        var dto = CharactersDTO()
        
        dto.offset = String(limit)
        
        self.provider?.getCharacthers(
            dto: dto,
            success: { serverModel in
                                
                let businessModel = BaseInteractor.parseArrayToBusinessModel(parserModel: [CharacterBusinessModel].self, arrayServerModels: serverModel?.data?.results)
                
                self.presenter?.getCharactersSuccess(businessModel: businessModel)
                
        }, failure: { error in
            self.presenter?.getCharactersFailure(error: error)
        })
        
    }
    
}
