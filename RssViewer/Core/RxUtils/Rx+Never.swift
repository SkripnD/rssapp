//
//  Rx+Never.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import RxSwift
import RxCocoa

extension SharedSequence {
    
    public func toNeverOf<T>(type: T.Type) -> SharedSequence<SharingStrategy, T> {
        return flatMap { _ -> SharedSequence<SharingStrategy, T> in .never() }
    }
    
}

extension SharedSequence where SharingStrategy == SignalSharingStrategy {
    
    public func toNeverDriverOf<T>(type: T.Type) -> Driver<T> {
        return flatMap { _ -> Driver<T> in .never() }
    }
    
}
