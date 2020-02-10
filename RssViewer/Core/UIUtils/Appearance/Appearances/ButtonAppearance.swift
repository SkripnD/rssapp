//
//  ButtonAppearance.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import UIKit

public extension Appearance where T: UIButton {
    func actionPrimaryButton() {
        guard let button = view as? Button else {
            return
        }
        let normalColor = UIColor.palette(.spray)
        let disabledColor = UIColor.palette(.spray).withAlphaComponent(0.5)
        let highlightedColor = UIColor.palette(.turquoiseBlue)
        button.backgroundConfig = Button.BackgroundConfig(normalColor: normalColor,
                                                          disabledColor: disabledColor,
                                                          highlightedColor: highlightedColor)
        
        button.setTitleColor(.palette(.white), for: .normal)
        button.setTitleColor(UIColor.palette(.white).withAlphaComponent(0.5), for: .disabled)
        button.titleLabel?.font = Fonts.headline
        button.cornerRadiusType = .exact(10)
    }
}
