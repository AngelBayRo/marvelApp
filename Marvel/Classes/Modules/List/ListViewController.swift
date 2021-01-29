//
//  ListViewController.swift
//  Marvel
//

import UIKit

protocol ListViewProtocol: BaseViewProtocol {
}

class ListViewController: BaseViewController {

    var presenter: ListPresenterProtocol? {
        return super.basePresenter as? ListPresenterProtocol
    }
    
    // MARK: IBOutlets declaration of all controls
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
    var tableViewManager: TableViewManager?
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewManager = TableViewManager(arrayTableViews: [CustomTableView(type: .list, tableView: self.tableView)], presenter: self.presenter)    
    }
    
    // MARK: IBActions declaration of all the controls
    
    // MARK: Private Functions

}

extension ListViewController: ListViewProtocol {

}
