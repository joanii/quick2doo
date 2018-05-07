//
//  TaskServiceType.swift
//  quick2doo
//
//  Created by Joan Disho on 09.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

enum TaskServiceError: Error {
    case creationFailed
    case updateFailed(TaskItem)
    case deletionFailed(TaskItem)
    case toggleFailed(TaskItem)
}

protocol TaskServiceType {
    @discardableResult func create(task: TaskItem, title: String) -> Observable<TaskItem>
    @discardableResult func update(task: TaskItem, title: String) -> Observable<TaskItem>
    @discardableResult func delete(task: TaskItem) -> Observable<Void>
    @discardableResult func toggle(task: TaskItem) -> Observable<TaskItem>
    @discardableResult func toggleChecked(for task: TaskItem) -> Observable<Bool>
    @discardableResult func search(withString string: Variable<String?>) -> Observable<[TaskItem]>
    func tasksAsObservable() -> Observable<Results<TaskItem>>
    func tasks() -> Results<TaskItem>
}
