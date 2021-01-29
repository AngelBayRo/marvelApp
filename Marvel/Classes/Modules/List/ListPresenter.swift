//
//  ListPresenter.swift
//  Marvel
//

import UIKit

protocol ListPresenterProtocol: BasePresenterProtocol {
    func getCharacters()
}

protocol ListInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func getCharactersSuccess(businessModel: [CharacterBusinessModel]?)
    func getCharactersFailure(error: CustomErrorModel)
}

class ListPresenter: BasePresenter {
    
    weak var view: ListViewProtocol? {
        return super.baseView as? ListViewProtocol
    }
    
    var router: ListRouterProtocol? {
        return super.baseRouter as? ListRouterProtocol
    }
    
    var interactor: ListInteractorInputProtocol? {
        return super.baseInteractor as? ListInteractorInputProtocol
    }
    
    var arrayCharacters: [CharacterViewModel] = []
    weak var tablePresenterDelegate: TablePresenterDelegate?
}

extension ListPresenter: ListPresenterProtocol {

    func viewDidLoad() {
        self.getCharacters()
    }
    
    func getCharacters() {
        self.interactor?.getCharacters()
    }
}

extension ListPresenter: ListInteractorOutputProtocol {
    
    func getCharactersSuccess(businessModel: [CharacterBusinessModel]?) {
        guard let businessModel = businessModel else { return }
        
        let viewModel = BasePresenter.parseArrayToViewModel(parserModel: [CharacterViewModel].self, arrayBusinessModels: businessModel)
        
        if (!self.arrayCharacters.isEmpty) {
            self.arrayCharacters.append(contentsOf: viewModel ?? [])
        } else {
            self.arrayCharacters = viewModel ?? []
        }
        
        self.tablePresenterDelegate?.dataSourceUpdated(.list)
    }
    
    func getCharactersFailure(error: CustomErrorModel) {
        error.presentationMessage = "ErrorDescription".localized
        self.showError(error: error)
    }
    
}

extension ListPresenter: TablePresenterProtocol {
    
    func numberOfCells(_ tableType: TableType, section: Int) -> Int {
        return self.arrayCharacters.count
    }
    
    func object(_ tableType: TableType, indexPath: IndexPath) -> Any {
        return self.arrayCharacters[indexPath.row]
    }
    
    func didTapRow(_ tableType: TableType, indexPath: IndexPath) {
        self.router?.goToDetail(element: self.arrayCharacters[indexPath.row])
    }
    
    func heightForRow(_ tableType: TableType, indexPath: IndexPath) -> Int {
        return 100
    }
    
    func loadMoreHeroes(_ tableType: TableType, indexPath: IndexPath) {
        self.interactor?.getMoreCharacters(limit: self.arrayCharacters.count)
    }
}
