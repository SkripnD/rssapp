//
//  ActivityIndicator.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import RxCocoa
import RxSwift

public class ActivityIndicator: SharedSequenceConvertibleType {
    public typealias E = Bool
    public typealias SharingStrategy = DriverSharingStrategy
    
    private let lock = NSRecursiveLock()
    private let relay = BehaviorRelay(value: false)
    private let loading: SharedSequence<SharingStrategy, Bool>
    
    public init() {
        loading = relay.asDriver()
            .distinctUntilChanged()
    }
    
    fileprivate func trackActivityOfObservable<O: ObservableConvertibleType>(_ source: O) -> Observable<O.E> {
        return source.asObservable()
            .do(onNext: { _ in
                self.sendStopLoading()
            }, onError: { _ in
                self.sendStopLoading()
            }, onCompleted: {
                self.sendStopLoading()
            }, onSubscribe: subscribed)
    }
    
    private func subscribed() {
        lock.lock()
        relay.accept(true)
        lock.unlock()
    }
    
    private func sendStopLoading() {
        lock.lock()
        relay.accept(false)
        lock.unlock()
    }
    
    public func asSharedSequence() -> SharedSequence<SharingStrategy, E> {
        return loading
    }
}

extension ObservableConvertibleType {
    public func trackActivity(_ activityIndicator: ActivityIndicator) -> Observable<E> {
        return activityIndicator.trackActivityOfObservable(self)
    }
}
