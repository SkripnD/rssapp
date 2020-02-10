//
//  StartRouter.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import Foundation
import UIKit

class StartRouter {
    private let resolver: DIResolver
    
    public init(resolver: DIResolver) {
        self.resolver = resolver
    }
    
    func start(window: UIWindow) {
        
        let assembly: Assembly = {
            return resolver.resolveAssembly(by: AssemblyName.rssEmptySources)
        }()
        
        assembly.startInWindow(window,
                               animationOptions: nil,
                               makeKeyWindow: true)
    }
}
