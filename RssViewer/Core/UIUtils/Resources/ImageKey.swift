//
//  ImageKey.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//
import Foundation
import UIKit

enum ImageKey {
    enum Common: String {
        case close = "ic_close"
    }
}

extension RawRepresentable where RawValue == String {
    var image: UIImage? {
        return UIImage(named: rawValue, in: Bundle.main, compatibleWith: nil)
    }
}
