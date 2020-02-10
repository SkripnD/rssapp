//
//  RssSourceAddAssembly.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//
 
import class UIKit.UIViewController
import class UIKit.UINavigationController

public class RssSourceAddAssembly: Assembly {
    private let resolver: DIResolver
    
    private var coordinator: RssSourceAddCoordinator?
        
    public init(resolver: DIResolver) {
        self.resolver = resolver
    }
    
    public func createRoot(modal: Bool, with bundle: AssemblyBundle?) -> UIViewController {
        guard let bundle = bundle else {
            fatalError("You cannot create RssSourceAddAssembly module without AssemblyBundle")
        }
        
        
        let vm = RssSourceAddViewModel.init(rssSourcesDAO: resolver.resolve(IRssSourceDAOService.self))
        let vc = RssSourceAddController(viewModel: vm)
                
        coordinator = RssSourceAddCoordinator(parent: vc,
                                              parentVM: vm,
                                              flowCompletion: bundle.flowCompletion)
        coordinator?.start()
        
        return UINavigationController(rootViewController: vc)
    }
}
