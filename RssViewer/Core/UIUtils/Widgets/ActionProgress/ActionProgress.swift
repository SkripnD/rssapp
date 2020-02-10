//
//  ActionProgress.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import UIKit
import SnapKit

public protocol ActionProgress {
    func showAnimated()
    func hideAnimated(success: Bool)
}

class ActionProgressView: UIView, ActionProgress {
    
    private static let defaultSize: CGFloat = 48

    private struct TimeConfiguration {
        let showAnimationDuration: TimeInterval
        let hideAnimationDuration: TimeInterval
        let minShowDuration: TimeInterval
        
        var minLife: TimeInterval {
            return showAnimationDuration + minShowDuration
        }
        
        func delayBeforeHide(_ animationStartTime: CFTimeInterval?) -> TimeInterval {
            guard let startTime = animationStartTime else {
                return minLife
            }
            let lifeTime = CACurrentMediaTime() - startTime
            return lifeTime < minLife ? minLife : 0
        }
    }
    
    private lazy var indicator = ProgressIndicator(style: .small)
    private lazy var indicatorContainer: UIView = {
        // TODO: Palette
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = size / 2
        return $0
    }(UIView())
    
    private let size: CGFloat
    private let timeConfig = TimeConfiguration(showAnimationDuration: 0.2,
                                               hideAnimationDuration: 0.3,
                                               minShowDuration: 0.25)
    private var animationStartTime: CFTimeInterval?
    
    init(size: CGFloat = ActionProgressView.defaultSize) {
        self.size = size
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        // TODO: Palette
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        isHidden = true
        isUserInteractionEnabled = true
        
        addSubview(indicatorContainer)
        indicatorContainer.addSubview(indicator)
        
        indicatorContainer.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(size)
            make.height.equalTo(size)
        }
        
        indicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    public func showAnimated() {
        guard isHidden else { return }
        
        isHidden = false
        updateConstraintsIfNeeded()
        layoutIfNeeded()
        
        let target = indicatorContainer.center
        indicatorContainer.center = CGPoint(x: target.x, y: target.y + bounds.size.height)
        alpha = 0
        
        animationStartTime = CACurrentMediaTime()
        
        UIView.animate(withDuration: timeConfig.showAnimationDuration,
                       delay: 0.05,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.indicatorContainer.center = target
                        self.alpha = 1
                       },
                       completion: nil)
    }
    
    public func hideAnimated(success: Bool) {
        guard !isHidden else { return }
        self.layoutIfNeeded()
        let delay = timeConfig.delayBeforeHide(animationStartTime)
        if success {
            UIView.animate(withDuration: timeConfig.hideAnimationDuration,
                           delay: delay,
                           options: [.curveEaseOut],
                           animations: {
                            self.indicatorContainer.alpha = 0
                            self.alpha = 0
            },
                           completion: { _ in
                            self.isHidden = true
                            self.indicatorContainer.alpha = 1
                            self.alpha = 1
            })
        } else {
            let center = indicatorContainer.center
            let target = CGPoint(x: center.x, y: center.y + bounds.size.height * (success ? -1: 1))
            UIView.animate(withDuration: timeConfig.hideAnimationDuration,
                           delay: delay,
                           options: [.curveEaseOut],
                           animations: {
                            self.indicatorContainer.center = target
                            self.alpha = 0
            },
                           completion: { _ in
                            self.isHidden = true
                            self.indicatorContainer.center = center
                            self.alpha = 1
            })
        }
    }
}
