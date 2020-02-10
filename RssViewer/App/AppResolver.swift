//
//  AppResolver.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import Foundation
import Swinject

public protocol DIResolver {
    func tryResolve<Service>(_ serviceType: Service.Type, by name: String?) -> Service?
}

extension DIResolver {
    public func resolve<Service>(_ serviceType: Service.Type, by name: String? = nil) -> Service {
        guard let service = tryResolve(serviceType, by: name) else { fatalError("can't resolve \(serviceType) ") }
        return service
    }
}

extension DIResolver {
    func resolveAssembly(by name: AssemblyName) -> Assembly {
        return resolve(Assembly.self, by: name.rawValue)
    }
}


class AppResolver: DIResolver {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func tryResolve<Service>(_ serviceType: Service.Type, by name: String?) -> Service? {
        return self.container.resolve(serviceType, name: name)
    }
}
