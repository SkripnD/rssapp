//
//  RssEmptySourcesController.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

// MARK: - Base

final class RssEmptySourcesController: BaseController {
    
    internal let viewModel: RssEmptySourcesViewModel
    
    // MARK: - Input Relays
   
    // MARK: - UI
    
    lazy var centeredView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.appearance.bigCenteredTitle()
        label.text = LocalizableKey.RssEmptySources.header.localized()
        return label
    }()
    
    lazy var addButton: UIButton = {
        let button = Button.init(title: LocalizableKey.RssEmptySources.addButton.localized())
        button.appearance.actionPrimaryButton()
        return button
    }()
    
    
    init(viewModel: RssEmptySourcesViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - BaseController / Lyfe cycle

extension RssEmptySourcesController {
    
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

extension RssEmptySourcesController {
    
    private func setupViews() {
        view.addSubview(centeredView)
        centeredView.addSubviews(headerLabel, addButton)
    }
    
    
    private func setupConstraints() {
        centeredView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(15)
            make.centerY.equalTo(self.view)
            make.height.greaterThanOrEqualTo(20)
        }
        
        headerLabel.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.greaterThanOrEqualTo(10)
        }
        
        addButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self.centeredView)
            make.width.equalTo(200)
            make.height.equalTo(44)
            make.bottom.equalToSuperview()
        }
        
    }
    
}

// MARK: - IViewModelOwner

extension RssEmptySourcesController: IViewModelOwner {
    
    func createViewModelInput() -> RssEmptySourcesViewModel.Input {
        return RssEmptySourcesViewModel.Input(
            addSourceTapped: addButton.rx.tap.asSignal()
        )
    }
    
    func subscribeToOutput(_ output: RssEmptySourcesViewModel.Output) {
         output.action.drive().disposed(by: disposeBag)
        
    }
    
}
