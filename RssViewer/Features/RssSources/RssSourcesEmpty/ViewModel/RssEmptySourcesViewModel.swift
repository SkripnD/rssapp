//
//  RssEmptySourcesViewModel.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class RssEmptySourcesViewModel: IViewModeling {
    
    // MARK: - Services
    
    private let rssSourcesDAO: IRssSourceDAOService
    
    public init(rssSourcesDAO: IRssSourceDAOService) {
        self.rssSourcesDAO = rssSourcesDAO
    }
    
    // MARK: - Constants
    
    enum Error: Swift.Error {
        case someError
    }
    
    enum Step {
        case addSource
    }
    
    // MARK: - IViewModeling
    
    struct Input {
        let addSourceTapped: Signal<Void>
    }
    
    struct Output {
        let action: Driver<Void>
    }
    
    func transform(input: Input) -> Output {
        let addSourceTapped = input.addSourceTapped
            .do(onNext: { [unowned self] _ in
                self.stepsRelay.accept(.addSource)
            })
            .asDriver(onErrorJustReturn: ())
        
        return Output(action: addSourceTapped)
    }
    
    // MARK: - Common
    
    private let stepsRelay = PublishRelay<Step>()
    private(set) lazy var steps: Signal<Step> = stepsRelay.asSignal()
    
}
