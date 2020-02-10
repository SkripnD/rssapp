//
//  UIButtonAppearance.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import UIKit

public extension UIButton {
    var appearance: Appearance<UIButton> {
        return Appearance<UIButton>(view: self)
    }
}

public extension Appearance where T: UIButton {
    func closeButton() {
        view.setTitle("", for: .normal)
        view.setImage(ImageKey.Common.close.image, for: .normal)
        view.imageView?.contentMode = .scaleAspectFit
    }
}
