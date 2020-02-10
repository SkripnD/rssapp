//
//  IViewModelOwner.swift
//  RssViewer
//
//  Created by Denis on 31/01/2020.
//  Copyright © 2020 Denis Skripnichenko. All rights reserved.
//

import Foundation

protocol IViewModelOwner {
    associatedtype ViewModel: IViewModeling
    
    var viewModel: ViewModel { get }
    
    func createViewModelInput() -> ViewModel.Input
    func subscribeToOutput(_ output: ViewModel.Output)
}
