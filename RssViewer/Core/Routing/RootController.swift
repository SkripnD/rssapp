//
//  RootController.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import UIKit

public final class RootController<Router>: UIViewController {
    
    private let doStart: (Router, UIViewController) -> Void
    private let router: Router
    
    public init(router: Router, doStart: @escaping (Router, UIViewController) -> Void) {
        self.router = router
        self.doStart = doStart
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        doStart(router, self)
    }
    
}
