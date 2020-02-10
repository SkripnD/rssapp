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

/*

public extension Appearance {
    
    func closeButton() {
        assert(view is UIButton)
        
        if let button = view as? UIButton {
            button.setTitle("", for: .normal)
            button.setImage(ImageKey.close.image, for: .normal)
        }
    }
    
    func circleButton() {
        assert(view is UIButton)
        
        if let button = view as? UIButton {
            button.setTitle("", for: .normal)
            button.setBackgroundImage(ImageKey.circleButton.image, for: .normal)
        }
    }

    func primaryButton() {
        assert(view is Button)
        if let button = view as? Button {
            button.backgroundConfig = Button.BackgroundConfig(normalColor: .palette(.tremberBlue),
                                                              disabledColor: .palette(.lighterBlue),
                                                              highlightedColor: .palette(.marineBlue))
            button.setTitleColor(.palette(.black), for: .normal)
            button.setTitleColor(UIColor.palette(.black).withAlphaComponent(0.1), for: .disabled)
            button.titleLabel?.font = Fonts.h4
            button.cornerRadiusType = .exact(10)
        }
    }
    
    func secondaryButton() {
        assert(view is Button)
        if let button = view as? Button {
            button.backgroundConfig = Button.BackgroundConfig(normalColor: .palette(.tremberGreen),
                                                              disabledColor: .palette(.lighterGreen),
                                                              highlightedColor: .palette(.grassGreen))
            button.setTitleColor(.palette(.black), for: .normal)
            button.setTitleColor(UIColor.palette(.black).withAlphaComponent(0.1), for: .disabled)
            button.titleLabel?.font = Fonts.h4
            button.cornerRadiusType = .exact(10)
        }
    }
    
    func declineButton() {
        assert(view is Button)
        if let button = view as? Button {
            button.backgroundConfig = Button.BackgroundConfig(normalColor: .palette(.tremberPink),
                                                              disabledColor: .palette(.lighterPink),
                                                              highlightedColor: .palette(.magentaPink))
            button.setTitleColor(.palette(.black), for: .normal)
            button.setTitleColor(UIColor.palette(.black).withAlphaComponent(0.1), for: .disabled)
            button.titleLabel?.font = Fonts.h4
            button.cornerRadiusType = .exact(10)
        }
    }
    
    func optionButton() {
        assert(view is Button)
        if let button = view as? Button {
            button.backgroundConfig = Button.BackgroundConfig(normalColor: .palette(.white),
                                                              disabledColor: .palette(.white),
                                                              highlightedColor: .palette(.white))
            button.setTitleColor(.palette(.black), for: .normal)
            button.setTitleColor(UIColor.palette(.black).withAlphaComponent(0.1), for: .disabled)
            button.borderConfig = Button.BorderConfig(width: 1,
                                                      normalColor: .palette(.grey40),
                                                      disabledColor: .palette(.grey10),
                                                      highlightedColor: .palette(.black))
            button.titleLabel?.font = Fonts.h4
            button.cornerRadiusType = .exact(10)
        }
    }
    
    enum SegmentedButtonStyle {
        case small, medium
        
        var cornerRadiusType: Button.CornerRadiusType {
            switch self {
            case .small:
                return .fullyRounded
            case .medium:
                return .exact(10)
            }
        }
        
        var font: UIFont {
            switch self {
            case .small:
                return Fonts.microSemibold
            case .medium:
                return Fonts.body
            }
        }
    }
    
    func segmentedButton(style: SegmentedButtonStyle) {
        assert(view is Button)
        if let button = view as? Button {
            button.cornerRadiusType = style.cornerRadiusType
            button.setTitleColor(.palette(.black), for: .normal)
            button.setTitleColor(UIColor.palette(.black).withAlphaComponent(0.1), for: .disabled)
            button.titleLabel?.lineBreakMode = .byWordWrapping
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = style.font
            button.backgroundConfig = Button.BackgroundConfig(normalColor: .palette(.white),
                                                              disabledColor: .palette(.grey10),
                                                              highlightedColor: .clear)
            
            button.borderConfig = Button.BorderConfig(width: 2,
                                                      normalColor: UIColor.clear.cgColor,
                                                      disabledColor:.palette(.black),
                                                      highlightedColor: .palette(.black))
            
            button.contentEdgeInsets = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24)
            
            button.layer.shadowRadius = 5
            button.layer.shadowOffset = .init(width: 0, height: 1)
            button.layer.shadowColor = .palette(.black)
            button.layer.shadowOpacity = 0.2
        }
    }
    
    func topicButton() {
        if let button = view as? UIButton {
            button.setTitleColor(.palette(.white), for: .normal)
            button.titleLabel?.font = Fonts.body
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
        }
    }
    
    func secondaryLabel() {
        assert(view is UILabel)
        if let label = view as? UILabel {
            label.textColor = .palette(.grey40)
            label.font = Fonts.micro
        }
    }

    func bigCenteredTitle() {
        assert(view is UILabel)
        if let label = view as? UILabel {
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 28, weight: .bold)
            label.textColor = .palette(.black)
        }
    }
    
    func primaryField() {
        assert(view is UITextField)
        if let field = view as? UITextField {
            field.leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 16, height: 0)))
            field.leftViewMode = .always
            field.borderStyle = .line
            field.backgroundColor = .palette(.white)
            field.tintColor = .palette(.black)
            field.textColor = .palette(.black)
            field.font = .systemFont(ofSize: 14)
        }
    }
    
    func withBorder() {
        view.layer.borderWidth = 1
        view.layer.borderColor = .palette(.black)
    }
    
    func textFieldValid() {
        view.layer.borderWidth = 0
        view.layer.borderColor = .palette(.black)
    }
    
    func textFieldInvalid() {
        view.layer.borderWidth = 1
        view.layer.borderColor = .palette(.magentaPink)
    }
    
    func h1() {
        switch view {
        case is Label:
            if let label = view as? Label {
                label.setKern(-2)
                label.setAttributedFont(Fonts.h1)
            }
        case is TextField:
            if let tf = view as? TextField {
                let attributes: [NSAttributedString.Key: Any] = [.kern: -2, .font: Fonts.h1]
                tf.defaultTextAttributes = attributes
                tf.placeholderAttributes = attributes
            }
        default:
            break
        }
    }
    
}*/
