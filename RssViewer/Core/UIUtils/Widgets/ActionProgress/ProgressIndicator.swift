//
//  ProgressIndicator.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import UIKit
import SnapKit

public final class ProgressIndicator: UIView {
    
    fileprivate struct Constants {
        static let animationKey = "rotation"
        static let animationDuration: CFTimeInterval = 0.45
    }
    
    public enum Style {
        case small, medium, large
        
        fileprivate var size: CGSize {
            switch self {
            case .small:
                return .init(width: 24, height: 24)
            case .medium:
                return .init(width: 40, height: 40)
            case .large:
                return .init(width: 96, height: 96)
            }
        }
        
        // TODO: Images
        fileprivate var icon: UIImage? {
            switch self {
            case .small:
                return UIImage(named: "uiutils_spinner_medium")
            case .medium:
                return UIImage(named: "uiutils_spinner_medium")
            case .large:
                return UIImage(named: "uiutils_spinner_medium")
            }
            
        }
    }
    
    
    private lazy var imageView: UIImageView = {
        $0.contentMode = .center
        return $0
    }(UIImageView(image: style.icon))
    
    private let style: Style
    
    public init(style: Style) {
        self.style = style
        super.init(frame: CGRect(origin: .zero, size: style.size))
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customInit() {
        backgroundColor = .clear
        
        addSubview(imageView)
        
        imageView.snp.matchSuperview()
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)

        animate()
    }
    
    private func animate() {
        
        guard layer.animation(forKey: Constants.animationKey) == nil else { return }
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        animation.toValue = NSNumber(value: Float.pi * 2)
        animation.duration = Constants.animationDuration
        animation.isCumulative = true
        animation.repeatCount = .infinity
        
        layer.add(animation, forKey: Constants.animationKey)
    }
    
    public override var intrinsicContentSize: CGSize {
        return style.size
    }
}
