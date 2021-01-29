//
//  DataAssembly.swift
//  Marvel
//

import Foundation

struct DataAssembly {
    
    // MARK: List Provider
    static func listProvider(interactor: BaseInteractor) -> ListProviderProtocol {
        let provider = ListProvider()
        provider.delegate = interactor
        provider.manager = NativeManager()
        return provider
    }
}
