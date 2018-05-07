//
//  BindableType.swift
//  quick2doo
//
//  Created by Joan Disho on 09.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import Foundation
import RxSwift

/**
 
     Each view controller conforming to the BindableType protocol
     will declare a viewModel variable and provide a bindViewModel() function
     to be called once the viewModel variable is assigned.
     This function will connect UI elements to observables and actions in the view model.
 
 */

protocol BindableType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension BindableType where Self: UIViewController {
    
    mutating func bind(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
    
}

extension BindableType where Self: UITableViewCell {
    
    mutating func bind(to model: Self.ViewModelType) {
        viewModel = model
        bindViewModel()
    }
    
}

extension BindableType where Self: UICollectionViewCell {
    
    mutating func bind(to model: Self.ViewModelType) {
        viewModel = model
        bindViewModel()
    }
    
}
