//
//  Coordinator.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import class UIKit.UIViewController

public protocol Coordinator: class {
    func start()
}

public protocol ParentCoordinator: Coordinator {
    func add(dependency coordinator: Coordinator)
    func remove(dependency coordinator: Coordinator)
}

public enum CoordinationResult<T> {
    case value(T)
    case cancelled
}
