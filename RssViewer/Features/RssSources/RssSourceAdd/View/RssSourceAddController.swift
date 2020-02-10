//
//  RssSourceAddController.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import Validator

// MARK: - Base

final class RssSourceAddController: BaseController {
    
    internal let viewModel: RssSourceAddViewModel
    
    // MARK: - Input Relays
   
    // MARK: - UI
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.appearance.closeButton()
        return button
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.appearance.header()
        label.text = LocalizableKey.RssSourcesAdd.header.localized()
        return label
    }()
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.appearance.contentHeader()
        label.text = LocalizableKey.RssSourcesAdd.information.localized()
        return label
    }()
    
    lazy var textField: TextField = {
        var fieldRules = ValidationRuleSet<String>()
        fieldRules.add(rule: ValidationRuleURL(error: RssAddValidationError(errorType: .rssWrongUrl)))
        fieldRules.add(rule: ValidationRuleLength.init(min:3, max: Int.max, lengthType: .characters, error: RssAddValidationError(errorType: .rssWrongUrl)))
        
        let field = TextField(placeholder: LocalizableKey.RssSourcesAdd.fieldPlaceholder.localized(),
                              validationRules: fieldRules)
        
        return field
    }()
    
    lazy var addButton: UIButton = {
        let button = Button.init(title: LocalizableKey.RssSourcesAdd.addButton.localized())
        button.appearance.actionPrimaryButton()
        return button
    }()
    
    init(viewModel: RssSourceAddViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - BaseController / Lyfe cycle

extension RssSourceAddController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoadWith(viewModelOwner: self)
        
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - UI Setups

extension RssSourceAddController {
    
    private func setupViews() {
        view.addSubviews(closeButton,
                         headerLabel,
                         informationLabel,
                         textField,
                         addButton)
    }
    
    
    private func setupConstraints() {
        headerLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(44)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.width.height.equalTo(26)
            make.centerY.equalTo(self.headerLabel)
        }
        
        informationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.greaterThanOrEqualTo(10)
        }
        
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(informationLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.greaterThanOrEqualTo(44)
        }
        
        addButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.textField.snp.bottom).offset(20)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
            make.height.equalTo(44)
        }
        
    }
    
}

// MARK: - IViewModelOwner

extension RssSourceAddController: IViewModelOwner {
    
    func createViewModelInput() -> RssSourceAddViewModel.Input {
        return RssSourceAddViewModel.Input(
            
        )
    }
    
    func subscribeToOutput(_ output: RssSourceAddViewModel.Output) {
         //output.action.drive().disposed(by: disposeBag)
        
        
        
        textField.isValid
            .bind(to: addButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
}
