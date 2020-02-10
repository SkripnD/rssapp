//
//  Rx+Void.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import RxCocoa
import RxSwift

extension SharedSequenceConvertibleType {
    
    public func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
    
}

extension ObservableType {
    
    public func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
