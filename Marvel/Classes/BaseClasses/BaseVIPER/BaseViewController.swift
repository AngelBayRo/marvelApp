//
//  BaseViewController.swift
//  Marvel
//

import Foundation
import UIKit

//Base class, it is declared as a good practice to implement new functions in a global way in the application.
class BaseViewController: UIViewController, NavigationBarManagerDelegate {
    
    internal var basePresenter: BasePresenterProtocol?
    var navigationBarManager: NavigationBarManager?
    
    var isFirstPresentation: Bool = true // Necesario para realizar el refresh de la pantalla, solo cuando se hace push, y no pop.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeUI()
        self.navigationBarManager = NavigationBarManager(viewController: self)
        self.navigationBarManager?.delegate = self
        self.navigationBarManager?.configureNavigationBar(model: NavigationBarModel(backButton: .backArrow, backGroundColor: CustomColor.viewPrimary.uiColor))
        
        self.basePresenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        self.basePresenter?.viewWillAppear(isFirstPresentation: self.isFirstPresentation)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.isFirstPresentation = false
        
        self.basePresenter?.viewDidAppear(isFirstPresentation: self.isFirstPresentation)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func initializeUI() {}
    
     // MARK: NavigationBar
     func navigationBarLeftButtonItemPressed(buttonItem: NavigationBarButtonItem) {}
     
     func navigationBarRightButtonItemPressed(buttonItem: NavigationBarButtonItem) {}
    
     // MARK: Loader
     func showLoading(fullScreen: Bool) {
//         Loader.showProgressHud()
     }
     
     func hideLoading() {
//         Loader.hideProgressHud()
     }

}

// MARK: BaseViewControllerProtocol
extension BaseViewController {
    
    func showAlertWith(title: String?, message: String?, actions: [CustomAlertAction]?) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let actions = actions {
            for action in actions {
                alert.addAction(UIAlertAction(title: action.title, style: .default, handler: { _ in
                    action.handler?(action)
                }))
            }
        } else {
            alert.addAction(UIAlertAction(title: "logout_inactivity_alert_accept_button".localized, style: UIAlertAction.Style.default, handler: nil))
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}
