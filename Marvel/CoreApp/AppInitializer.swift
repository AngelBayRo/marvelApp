//
//  AppInitializer.swift
//  Marvel
//

import Foundation
import UIKit

class AppInitializer: NSObject {
    
    // Check first open
    func checkIfFirstOpen() {

        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if !launchedBefore {
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            
        }
    }
    
    //first we need to set up rootViewController
    func installRootViewController() {
        BaseRouter.setRoot(navigationController: ListAssembly.listView())
    }
}
