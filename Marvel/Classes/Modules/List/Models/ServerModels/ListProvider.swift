//
//  ListProvider.swift
//  Marvel
//

import Foundation

protocol ListProviderProtocol: AnyObject {
    func getCharacthers(dto: CharactersDTO, success: @escaping (CharacterDataWrapperServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

final class ListProvider: BaseProvider, ListProviderProtocol {

    // MARK: Internal functions declaration of all functions and protocol variables
    func getCharacthers(dto: CharactersDTO, success: @escaping (CharacterDataWrapperServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
        
        let providerDTO = ListProviderRequest.getCharacthersConstants(params: dto)
        _ = self.request(dto: providerDTO, success: { data in
            
            let serverModel = BaseProviderUtils.parseToServerModel(parserModel: CharacterDataWrapperServerModel.self, data: data)
            success(serverModel)
            
        }, failure: { error in
            failure(error)
        })
        
    }
}

struct CharactersDTO: BaseProviderParamsDTO {
    var offset: String?
}

struct ListProviderRequest {
    
    static func getCharacthersConstants(params: BaseProviderParamsDTO?) -> ProviderDTO {
        return ProviderDTO(params: params?.encode(),
                           method: .get,
                           urlContext: .backend,
                           endpoint: URLEndpoint.characters)
    }
}
