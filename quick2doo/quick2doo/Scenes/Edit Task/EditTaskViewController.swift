//
//  EditTaskViewController.swift
//  quick2doo
//
//  Created by Joan Disho on 13.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EditTaskViewController: UIViewController, BindableType {

    // MARK: ViewModel
    var viewModel: EditTaskViewModel!
    
    // MARK: IBOutlet
    @IBOutlet var taskDescriptionTextView: UITextView!
    
    // MARK: Private
    private var okBarButton: UIBarButtonItem!
    private var cancelBarButton: UIBarButtonItem!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskDescriptionTextView.becomeFirstResponder()
        addBarButtonItems()
    }
    
    //MARK: BindableType
    
    func bindViewModel() {
        
        viewModel.navBarMessage
            .bind(to: self.navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        viewModel.taskDescription
            .asObservable()
            .bind(to: taskDescriptionTextView.rx.text)
            .disposed(by: disposeBag)
        
        taskDescriptionTextView
            .rx
            .text
            .orEmpty
            .bind(to: viewModel.taskDescription)
            .disposed(by: disposeBag)
    
        okBarButton.rx.action = viewModel.onOKButtonAction()
        cancelBarButton.rx.action = viewModel.onCancelButtonAction
    }
    
    // MARK: UI
    
    private func addBarButtonItems()  {
        okBarButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: nil)
        cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
        
        self.navigationItem.leftBarButtonItem = okBarButton
        self.navigationItem.rightBarButtonItem = cancelBarButton
    }

}
