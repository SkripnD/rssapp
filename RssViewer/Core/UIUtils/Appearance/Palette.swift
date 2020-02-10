//
//  Palette.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//
import UIKit

public enum Palette: String {
    case white
    case black
    case spray
    case turquoiseBlue
    case grey90
    case grey40
    
    var color: UIColor {
        return UIColor(named: rawValue, in: Bundle.main, compatibleWith: nil)!
    }
    
    var cgColor: CGColor {
        return color.cgColor
    }
}

public extension UIColor {
    
    static func palette(_ palette: Palette) -> UIColor {
        return palette.color
    }
    
}

public extension CGColor {
    
    static func palette(_ palette: Palette) -> CGColor {
        return palette.cgColor
    }
    
}
