//
//  RssSourceAddCoordinator.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import RxCocoa
import RxSwift

class RssSourceAddCoordinator: Coordinator {
    
    private let parent: UIViewController
    private let parentVM: RssSourceAddViewModel
    private let flowCompletion: FlowCompletion
    private let disposeBag = DisposeBag()
        
    init(parent: UIViewController,
         parentVM: RssSourceAddViewModel,
         flowCompletion: FlowCompletion) {
        self.parent = parent
        self.parentVM = parentVM
        self.flowCompletion = flowCompletion
    }
    
    func start() {
        parentVM.steps.emit(onNext: { [unowned self] step in
            
        })
        .disposed(by: disposeBag)
    }
    
}
