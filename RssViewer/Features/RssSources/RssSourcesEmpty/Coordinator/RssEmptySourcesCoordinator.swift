//
//  RssEmptySourcesCoordinator.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import RxCocoa
import RxSwift

class RssEmptySourcesCoordinator: Coordinator {
    private let resolver: DIResolver
    private let parent: UIViewController
    private let parentVM: RssEmptySourcesViewModel
    private let disposeBag = DisposeBag()
        
    init(parent: UIViewController,
         parentVM: RssEmptySourcesViewModel,
         resolver: DIResolver) {
        self.parent = parent
        self.parentVM = parentVM
        self.resolver = resolver
    }
    
    func start() {
        parentVM.steps.emit(onNext: { [unowned self] step in
            switch step {
            case .addSource:
                self.openAddSource(from: self.parent) { (result) in
                    
                }
            }
        })
        .disposed(by: disposeBag)
    }
    
    // MARK: - Routing
    
    private func openAddSource(from parent: UIViewController,
                               completion: @escaping (Bool) -> Void) {
        let assembly = resolver.resolve(Assembly.self, by: AssemblyName.rssAddSource.rawValue)
        
        let flowCompletion = FlowCompletion(onCompleteNavigation: { _, data in
            completion(false)
        })
        
        assembly.startModally(from: parent,
                              animated: true,
                              with: AssemblyBundle(flowCompletion: flowCompletion))
    }
    
}



