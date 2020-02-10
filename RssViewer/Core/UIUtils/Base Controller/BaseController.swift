//
//  BaseController.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BaseController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Palette.white.color
    }
    
}

// MARK: - View Modeling

extension BaseController {
    func didLoadWith<T: IViewModelOwner>(viewModelOwner: T) {
        let input = viewModelOwner.createViewModelInput()
        // swiftlint:disable:next force_unwrapping
        viewModelOwner.subscribeToOutput(viewModelOwner.viewModel.transform(input: input))
    }
}
