//
//  TaskService.swift
//  quick2doo
//
//  Created by Joan Disho on 09.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
import RxRealm

class TaskService: TaskServiceType {
    
    private let realmProvider: RealmProvider
    
    init(realmProvider: RealmProvider = LocalRealmProvider()) {
        self.realmProvider = realmProvider
    }
    
    @discardableResult 
    func create(task: TaskItem, title: String) -> Observable<TaskItem> {
        let result = realmProvider.performRealmOperation("creating task") { realm in
            task.title = title
            task.uid = (realm.objects(TaskItem.self).max(ofProperty: "uid") ?? 0) + 1
            realm.add(task)
        }
        
        return result ? .just(task) : .error(TaskServiceError.creationFailed)
    }
    
    @discardableResult 
    func update(task: TaskItem, title: String) -> Observable<TaskItem> {
        let result = realmProvider.performRealmOperation("updating task") { realm in
            task.title = title
            realm.add(task)
        }
        
        return result ? .just(task) : .error(TaskServiceError.updateFailed(task))
    }
    
    @discardableResult 
    func delete(task: TaskItem) -> Observable<TaskItem> {
        let result = realmProvider.performRealmOperation("deleting task") { realm in
            realm.delete(task)
        }
        
        return result ? .just(task) : .error(TaskServiceError.deletionFailed(task))
    }
    
    @discardableResult 
    func toggle(task: TaskItem) -> Observable<TaskItem> {
        let result = realmProvider.performRealmOperation("toggling task") { realm in
            if task.checked == nil {
                task.checked = Date()
            } else {
                task.checked = nil
            }
        }
        
        return result ? .just(task) : .error(TaskServiceError.toggleFailed(task))
    }
    
    func toggleChecked(for task: TaskItem) -> Observable<Bool> {
        return task.rx.observe(Date.self, "checked").map { $0 != nil }
    }
    
    func tasks() -> Observable<Results<TaskItem>> {
        let realm = realmProvider.defaultRealm
        let tasks = realm.objects(TaskItem.self)
        return Observable.collection(from: tasks)
    }
    
    // MARK: Load dummy data
    func loadData() {
        let realm = realmProvider.defaultRealm
        if realm.objects(TaskItem.self).isEmpty {
            ["Chapter 5: Filtering operators",
             "Chapter 4: Observables and Subjects in practice",
             "Chapter 3: Subjects",
             "Chapter 2: Observables",
             "Chapter 1: Hello, RxSwift"].forEach {
                self.create(task: TaskItem(), title: $0)
            }
        }
    }
    
}
