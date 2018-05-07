//
//  EditTaskViewModel.swift
//  quick2doo
//
//  Created by Joan Disho on 13.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import RxSwift
import Action

struct EditTaskViewModel {
    
    // MARK: Input
    let sceneCoordinator: SceneCoordinatorType
    let taskService: TaskServiceType
    let taskDescription = Variable<String?>("")
    let mode = Variable<TaskViewMode>(.create)
    
    // MARK: Output
    let isTaskDescriptionEmpty: Observable<Bool>
    let isInCreateMode: Observable<Bool>
    let navBarMessage: Observable<String>
    
    // MARK Private
    private let disposeBag = DisposeBag()
    
    init(sceneCoordinator: SceneCoordinatorType = SceneCoordinator.shared, taskService: TaskServiceType = TaskService(), mode: TaskViewMode) {
        self.sceneCoordinator = sceneCoordinator
        self.taskService = taskService
        self.mode.value = mode
        
        isTaskDescriptionEmpty = taskDescription.asObservable().map { ($0?.isEmpty)!}
        isInCreateMode = self.mode.asObservable().map { $0 == .create }
        
       navBarMessage = Observable.combineLatest(isTaskDescriptionEmpty, isInCreateMode).map {
            switch ($0, $1) {
            case (true, true),(true, false) :
                return "Write something 🙄"
            case (false, true):
                return "Create 👍"
            case (false, false):
                return "Edit ✏️"
            }
        }
        
        fillInFields(forExistingTask: mode.existingTask)
    }
    
    // MARK: Actions
    
    func onOKButtonAction() -> CocoaAction { 
        return CocoaAction {
            guard let existingTask = self.mode.value.existingTask else {  
                self.taskService.create(task: TaskItem(), title: self.taskDescription.value ?? "")
                return self.sceneCoordinator.pop(animated: true) 
            }
            self.taskService.update(task: existingTask, title: self.taskDescription.value ?? "")
            return self.sceneCoordinator.pop(animated: true)
        }
    }
    
    lazy var onCancelButtonAction: CocoaAction = {
        let sceneCoordinator = self.sceneCoordinator
        return CocoaAction {
            sceneCoordinator.pop(animated: true)
        }
    }()
    
    // MARK: Helpers
    private func fillInFields(forExistingTask task: TaskItem?) {
        guard let existingTask = task else { return }
        existingTask.rx.observe(String.self, "title").bind(to: taskDescription).disposed(by: disposeBag)
    }
    
}
