//
//  ActionProgressOwner.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import UIKit
import SnapKit

public protocol ActionProgressOwner {
    var actionProgressContainer: UIView { get }
    var actionProgress: ActionProgress { get }
}

public extension ActionProgressOwner where Self: UIViewController {
    var actionProgressContainer: UIView {
        return UIApplication.shared.keyWindow ?? view
    }
}

// MARK: - Defaults
public extension ActionProgressOwner {
    
    var actionProgress: ActionProgress {
        if let existingProgress = actionProgressContainer.subviews
            .first(where: { $0 is ActionProgress }) as? ActionProgressView {
            actionProgressContainer.bringSubviewToFront(existingProgress)
            return existingProgress
        } else {
            let actionProgress = ActionProgressView()
            actionProgressContainer.addSubview(actionProgress)
            actionProgress.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            return actionProgress
        }
    }
}
