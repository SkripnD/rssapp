//
//  FlowCompletion.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import class UIKit.UIViewController

public struct FlowCompletion {
    public typealias Action = () -> Void
    
    private var beforeCompleteActions: [Action] = []
    
    private let onCompleteNavigation: (UIViewController, Any?) -> Void
    
    public init(onCompleteNavigation: @escaping (UIViewController, Any?) -> Void) {
        self.onCompleteNavigation = onCompleteNavigation
    }
    
    public mutating func addAction(action: @escaping Action) {
        beforeCompleteActions.append(action)
    }
    
    public func execute(with vc: UIViewController, and customData: Any? = nil) {
        beforeCompleteActions.forEach { $0() }
        onCompleteNavigation(vc, customData)
    }
}
