//
//  TaskCellViewModel.swift
//  quick2doo
//
//  Created by Joan Disho on 09.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import RxSwift
import Action

struct TaskCellViewModel {
    
    // MARK: Input
    let taskService: TaskServiceType
    let task: TaskItem
    
    // MARK: Output
    let title: Observable<String?>
    let isChecked: Observable<Bool>
    
    init(taskService: TaskServiceType = TaskService(), task: TaskItem = TaskItem()) {
        self.taskService = taskService
        self.task = task
        self.title = task.rx.observe(String.self, "title")
        self.isChecked = taskService.toggleChecked(for: task)
    }
    
    lazy var buttonAction: CocoaAction = {
        let task = self.task
        let taskService = self.taskService
        return CocoaAction {
            return taskService.toggle(task: task).map{ _ in () } 
        }
    }()
}
