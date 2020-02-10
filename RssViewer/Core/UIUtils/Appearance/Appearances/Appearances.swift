//
//  Appearances.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import UIKit

public class Appearance<T> {
    let view: T
    
    public init(view: T) {
        self.view = view
    }
    
    public func apply(_ appearance: (Appearance) -> Void) {
        appearance(self)
    }
}
