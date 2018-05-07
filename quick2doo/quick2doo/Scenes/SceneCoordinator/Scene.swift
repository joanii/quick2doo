//
//  Scene.swift
//  quick2doo
//
//  Created by Joan Disho on 09.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import UIKit

/**
     Refers to a screen managed by a view controller.
     It can be a regular screen, or a modal dialog.
     It comprises a view controller and a view model.
*/

enum Scene {
    case taskList(TasksViewModel)
    case editTask(EditTaskViewModel)
}

extension Scene {
    func viewController() -> UIViewController {
        switch self {
        case .taskList(let viewModel):
            var vc = TasksViewController.instantiateFromNib()
            let navigationController = UINavigationController(rootViewController: vc)
            vc.bind(to: viewModel)
            return navigationController
        case .editTask(let viewModel):
            var vc = EditTaskViewController.instantiateFromNib()
            let navigationController = UINavigationController(rootViewController: vc)
            vc.bind(to: viewModel)
            return navigationController
        }
    }
}
