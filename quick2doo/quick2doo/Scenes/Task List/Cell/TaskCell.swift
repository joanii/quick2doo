//
//  TaskCell.swift
//  quick2doo
//
//  Created by Joan Disho on 09.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskCell: UITableViewCell, BindableType {

    // MARK: ViewModel
    var viewModel: TaskCellViewModel!
    
    // MARK: IBOutlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var toggleButton: UIButton!
    
    // MARK: Private
    private let disposeBag = DisposeBag()
  
    // MARK: BindableType
    
    func bindViewModel() {
        viewModel.title.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        viewModel.isChecked.map { $0 ? #imageLiteral(resourceName: "checked") : #imageLiteral(resourceName: "not_checked") }.bind(to: toggleButton.rx.image()).disposed(by: disposeBag)
        toggleButton.rx.action = viewModel.buttonAction
    }
    
    override func prepareForReuse() {
        toggleButton.rx.action = nil
        super.prepareForReuse()
    }
    
}
