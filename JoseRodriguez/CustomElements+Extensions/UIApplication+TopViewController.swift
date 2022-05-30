//
//  UIApplication+TopViewController.swift
//  Reto_Tecnico_Jose_QR
//
//  Created by Jose Leoncio Quispe Rodriguez on 4/05/22.
//

import Foundation
import UIKit

public extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
