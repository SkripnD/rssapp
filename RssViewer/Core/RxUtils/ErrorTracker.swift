//
//  ErrorTracker.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import RxSwift
import RxCocoa

public class ErrorTracker: SharedSequenceConvertibleType {
    public typealias SharingStrategy = DriverSharingStrategy
    
    private let subject = PublishSubject<Error>()
    
    public init() {}
    
    public func trackError<O: ObservableConvertibleType>(from source: O) -> Observable<O.E> {
        return source.asObservable().do(onError: onError)
    }
    
    public func asSharedSequence() -> SharedSequence<SharingStrategy, Error> {
        return subject.asObservable().asDriver { _ in
            Driver.empty()
        }
    }
    
    public func asObservable() -> Observable<Error> {
        return subject.asObservable()
    }
    
    private func onError(_ error: Error) {
        subject.onNext(error)
    }
    
    deinit {
        subject.onCompleted()
    }
}

extension ObservableConvertibleType {
    public func trackError(_ errorTracker: ErrorTracker) -> Observable<E> {
        return errorTracker.trackError(from: self)
    }
}
