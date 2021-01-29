//
//  BaseProtocols.swift
//  Marvel
//

import Foundation

// Protocol used to the Presenter can communicate with View
protocol BaseViewProtocol: class {
    func showAlertWith(title: String?, message: String?, actions: [CustomAlertAction]?)
    func showLoading(fullScreen: Bool)
    func hideLoading()
}

// Protocol used to the View can communicate with Presenter
protocol BasePresenterProtocol: class {
    func viewDidLoad()
    func viewWillAppear(isFirstPresentation: Bool)
    func viewDidAppear(isFirstPresentation: Bool)
}

extension BasePresenterProtocol {
    func viewDidLoad() {}
    func viewWillAppear(isFirstPresentation: Bool) {}
    func viewDidAppear(isFirstPresentation: Bool) {}
}

// Protocol used to the Presenter can communicate with Interactor
protocol BaseInteractorInputProtocol: class {
}

// Protocol used to the Interactor can communicate with Presenter
protocol BaseInteractorOutputProtocol: class {
    func genericErrorHappened(error: CustomErrorModel) //Method used to notify Presenter that error has happened
    func asyncTaskStarted()
    func asyncTaskFinished()
    func networkErrorHappened()
}

extension BaseInteractorOutputProtocol {
    func genericErrorHappened(error: CustomErrorModel) {}
    func asyncTaskStarted() {}
    func asyncTaskFinished() {}
}

// Protocol used to the Presenter can communicate with Router
protocol BaseRouterProtocol: class {
    
}

// Delegate used to report that a navigation has been done. It will usually be implemented by the Presenter
protocol BaseRouterDelegate: class {
    func navigationDone()
}

// Delegate used to report actions with web services. It will usually be implemented by the Interactor
protocol BaseProviderDelegate: class {
    func requestDone()
    func responseGet()
    func networkNotReachable()
}
