//
//  ViewModeling.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol IViewModeling {
    associatedtype Step
    associatedtype Input
    associatedtype Output
    
    var steps: Signal<Step> { get }
    func transform(input: Input) -> Output
}
