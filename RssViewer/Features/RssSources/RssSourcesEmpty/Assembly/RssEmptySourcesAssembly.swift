//
//  RssEmptySourcesAssembly.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import class UIKit.UIViewController

public class RssEmptySourcesAssembly: Assembly {
    private let resolver: DIResolver
    
    private var coordinator: RssEmptySourcesCoordinator?
        
    public init(resolver: DIResolver) {
        self.resolver = resolver
    }
    
    public func createRoot(modal: Bool, with bundle: AssemblyBundle?) -> UIViewController {
        let vm = RssEmptySourcesViewModel.init(rssSourcesDAO: resolver.resolve(IRssSourceDAOService.self))
        let vc = RssEmptySourcesController(viewModel: vm)
        
        coordinator = RssEmptySourcesCoordinator(parent: vc,
                                                 parentVM: vm,
                                                 resolver: resolver)
        coordinator?.start()
        
        return vc
    }
}
