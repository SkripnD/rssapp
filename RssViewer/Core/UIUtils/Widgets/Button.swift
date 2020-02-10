//
//  Button.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import Foundation
import UIKit

public class Button: UIButton {
    
    // MARK: - Config objects
    
    public struct BorderConfig {
        let width: CGFloat
        let normalColor: CGColor
        let disabledColor: CGColor
        let highlightedColor: CGColor
        
        func colorFor(enabled: Bool, highlighted: Bool) -> CGColor {
            guard enabled else { return disabledColor }
            return highlighted ? highlightedColor : normalColor
        }
    }
    
    public struct BackgroundConfig {
        let normalColor: UIColor
        let disabledColor: UIColor
        let highlightedColor: UIColor
        
        public init(normalColor: UIColor, disabledColor: UIColor, highlightedColor: UIColor) {
            self.normalColor = normalColor
            self.disabledColor = disabledColor
            self.highlightedColor = highlightedColor
        }
        
        func colorFor(enabled: Bool, highlighted: Bool) -> UIColor {
            guard enabled else { return disabledColor }
            return highlighted ? highlightedColor : normalColor
        }
    }
    
    public enum CornerRadiusType {
        case none
        case exact(CGFloat)
        case fullyRounded
    }
    
    // MARK: - Main
    
    override public var isEnabled: Bool {
        didSet {
            setupBorder()
            setupBackgroundColor()
        }
    }
    
    override public var isHighlighted: Bool {
        didSet {
            setupBorder()
            setupBackgroundColor()
        }
    }
    
    override public var isSelected: Bool {
        didSet {
            setupBorder()
            setupBackgroundColor()
        }
    }
    
    override public init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(title: String) {
        self.init()
        setTitle(title, for: .normal)
    }

    public var backgroundConfig: BackgroundConfig? {
        didSet {
            setupBackgroundColor()
        }
    }
    
    public var borderConfig: BorderConfig? {
        didSet {
            setupBorder()
        }
    }
    
    public var cornerRadiusType: CornerRadiusType = .none {
        didSet {
            if case .exact(let cornerRadius) = cornerRadiusType {
                layer.cornerRadius = cornerRadius
            }
        }
    }
    
    private func setupBackgroundColor() {
        guard let config = backgroundConfig else { return }
        backgroundColor = config.colorFor(enabled: isEnabled, highlighted: isHighlighted || isSelected)
    }
    
    private func setupBorder() {
        guard let config = borderConfig else { return }
        layer.borderColor = config.colorFor(enabled: isEnabled, highlighted: isHighlighted || isSelected)
        layer.borderWidth = config.width
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupBorder()
        setupBackgroundColor()
        if case .fullyRounded = cornerRadiusType {
            layer.cornerRadius = bounds.height / 2
        }
        
    }
    
}
