//
//  TextField.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Validator

public class TextField: UIView {
    
    private let disposeBag = DisposeBag()
    
    private var validationRules: ValidationRuleSet<String>?
    public var isValid: Observable<Bool>!
    
    public var placeholderAttributes: [NSAttributedString.Key: Any]? {
        didSet {
            applyPlaceholder()
        }
    }
    
    public var defaultTextAttributes: [NSAttributedString.Key: Any]? {
        didSet {
            guard let defaultTextAttributes = defaultTextAttributes else { return }
            textField.defaultTextAttributes = defaultTextAttributes
        }
    }
    
    public var placeholder: String = "" {
        didSet {
            applyPlaceholder()
        }
    }
    
    private var isEditing: Bool = false {
        didSet {
            changeUnderlineColor()
        }
    }
    
    // MARK: - UI elements
    
    public private(set) lazy var textField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.smartInsertDeleteType = .no
        return textField
    }()
    
    private let underline: UIView = {
        let view = UIView()
        view.backgroundColor = .palette(.black)
        return view
    }()
    
    private lazy var validationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(placeholder: String? = nil) {
        self.init(frame: CGRect.zero)
        if let placeholder = placeholder {
            self.placeholder = placeholder
        }
        customInit()
    }
    
    public convenience init(placeholder: String? = nil,
                            validationRules: ValidationRuleSet<String>? = nil) {
        self.init(frame: CGRect.zero)
        
        if let placeholder = placeholder {
            self.placeholder = placeholder
        }
        
        if let validationRules = validationRules {
            self.validationRules = validationRules
        }
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customInit() {
        textField.addSubview(underline)
        addSubviews(textField, validationLabel)
        
        setupConstraints()
        applyPlaceholder()
        changeUnderlineColor()
        setupValidation()
    }
    
    // MARK: - Setup / actions
    
    private func setupConstraints() {
        underline.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(44)
        }
        
    }
    
    private func setupValidation() {
            isValid = textField.rx.text.orEmpty
                .map { [unowned self] text -> Bool in
                    if self.validateText(text: text) != nil {
                        return false
                    }
                    return true
                }
                .share(replay: 1)
            
            isValid
                .bind(to: validationLabel.rx.isHidden)
                .disposed(by: disposeBag)
    }
    
    private func applyPlaceholder() {
        if let attributes = placeholderAttributes {
            let attributedString = NSMutableAttributedString(string: placeholder, attributes: attributes)
            textField.attributedPlaceholder = attributedString
        } else {
            textField.placeholder = placeholder
        }
    }
    
    private func changeUnderlineColor() {
        underline.backgroundColor = isEditing ? .palette(.black) : .palette(.grey40)
    }
    
    private func validateText(text: String) -> String? {
        guard let validationRules = validationRules else {
            return nil
        }
        let result = text.validate(rules: validationRules)
        switch result {
            case .valid:
                return nil
            case .invalid(let failures):
                return failures.first?.message
        }
    }

}

// MARK: - UITextFieldDelegate
extension TextField: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {        guard let textFieldText = textField.text else { return false }
        
        return textFieldText.canApplyReplacement(
            with: range,
            text: string,
            characterLimit: Int.max
        )
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        isEditing = true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        isEditing = false
    }
}


// MARK: - String extension

fileprivate extension String {
    func canApplyReplacement(with range: NSRange, text: String, characterLimit: Int) -> Bool {
        guard let rangeOfTextToReplace = Range(range, in: self) else { return false }
        let substringToReplace = self[rangeOfTextToReplace]
        let count = self.count - substringToReplace.count + text.count
        return count <= characterLimit
    }
}

