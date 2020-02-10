//
//  RssSourceAddViewModel.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class RssSourceAddViewModel: IViewModeling {
    
    // MARK: - Services
    
    private let rssSourcesDAO: IRssSourceDAOService
    
    public init(rssSourcesDAO: IRssSourceDAOService) {
        self.rssSourcesDAO = rssSourcesDAO
    }
    
    // MARK: - Constants
    
    enum Error: Swift.Error {
        
    }
    
    enum Step {
        
    }
    
    // MARK: - IViewModeling
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        
        return Output()
    }
    
    // MARK: - Common
    
    private let stepsRelay = PublishRelay<Step>()
    private(set) lazy var steps: Signal<Step> = stepsRelay.asSignal()
    
}
