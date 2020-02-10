//
//  Snp+Extensions.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import SnapKit

public extension ConstraintViewDSL {
    func matchSuperview(insets: UIEdgeInsets = .zero, closure: ((ConstraintMaker) -> Void)? = nil) {
        makeConstraints { make in
            make.matchSuperview(insets: insets)
            closure?(make)
        }
    }
    
    func matchView(_ view: UIView, insets: UIEdgeInsets = .zero) {
        makeConstraints { make in
            make.matchView(view.snp, insets: insets)
        }
    }
}

fileprivate extension ConstraintMaker {
    func matchSuperview(insets: UIEdgeInsets = .zero) {
        top.equalToSuperview().offset(insets.top)
        bottom.equalToSuperview().offset(-insets.bottom)
        trailing.equalToSuperview().offset(-insets.right)
        leading.equalToSuperview().offset(insets.left)
    }
    
    func matchView(_ reference: ConstraintViewDSL, insets: UIEdgeInsets = .zero) {
        top.equalTo(reference.top).offset(insets.top)
        bottom.equalTo(reference.bottom).offset(-insets.bottom)
        trailing.equalTo(reference.trailing).offset(-insets.right)
        leading.equalTo(reference.leading).offset(insets.left)
    }
}
