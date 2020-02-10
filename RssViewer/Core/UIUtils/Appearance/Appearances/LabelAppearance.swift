//
//  LabelAppearance.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import UIKit

public extension UILabel {
    var appearance: Appearance<UILabel> {
        return Appearance<UILabel>(view: self)
    }
}

public extension Appearance where T: UILabel {
    func bigCenteredTitle() {        
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.font = Fonts.h4
        view.textColor = .palette(.black)
    }
    
    func header() {
        view.numberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.font = Fonts.h3
        view.textColor = .palette(.black)
    }
    
    func contentHeader() {
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .left
        view.font = Fonts.h5
        view.textColor = .palette(.grey90)
    }
}
