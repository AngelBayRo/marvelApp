//
//  UIViewController+Extension.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    public class func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
    
    static func topViewController(withRoot root: UIViewController?) -> UIViewController? {
        if let newRoot = (root as? UITabBarController)?.selectedViewController {
            return topViewController(withRoot: newRoot)
        }
        
        if let newRoot = (root as? UINavigationController)?.visibleViewController {
            return topViewController(withRoot: newRoot)
        }
        
        if let newRoot = root?.presentedViewController {
            return topViewController(withRoot: newRoot)
        }
        
        return root
    }
}
