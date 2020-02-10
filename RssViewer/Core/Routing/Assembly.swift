//
//  Assembly.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import Foundation
import UIKit

public protocol Assembly {
    func createRoot(modal: Bool, with bundle: AssemblyBundle?) -> UIViewController
}

// MARK: - Defaults
public extension Assembly {
    
    func createRoot(modal: Bool = false,  with bundle: AssemblyBundle?) -> UIViewController {
        return self.createRoot(modal: modal, with: bundle)
    }
    
    func startInWindow(_ window: UIWindow,
                       animationOptions: UIView.AnimationOptions? = nil,
                       makeKeyWindow: Bool = false,
                       with bundle: AssemblyBundle? = nil) {
        
        let vc = createRoot(modal: false, with: bundle)
        
        let navcontroller = UINavigationController(rootViewController: vc)
        if let animationOptions = animationOptions {
            UIView.transition(with: window,
                              duration: 0.25,
                              options: animationOptions,
                              animations: { window.rootViewController = vc },
                              completion: nil)
        } else {
            window.rootViewController = navcontroller
        }
        
        if makeKeyWindow {
            window.makeKeyAndVisible()
        }
    }
    
    func startModally(from parent: UIViewController,
                      animated: Bool = true,
                      with bundle: AssemblyBundle? = nil) {
        let vc = createRoot(modal: true, with: bundle)
        parent.present(vc, animated: animated, completion: nil)
    }
}
