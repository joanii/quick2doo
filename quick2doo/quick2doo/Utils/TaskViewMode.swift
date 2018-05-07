//
//  TaskViewMode.swift
//  quick2doo
//
//  Created by Joan Disho on 13.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import Foundation

enum TaskViewMode: Equatable {
    case create
    case edit(TaskItem)
    
    var existingTask: TaskItem? {
        switch self {
        case .create:
            return nil
        case .edit(let task):
            return task
        }
    }
    
    static func ==(lhs: TaskViewMode, rhs: TaskViewMode) -> Bool {
        switch (lhs, rhs) {
        case (.create, .create):
            return true
        case (.edit(let task1), .edit(let task2)):
            return task1 == task2
        default:
            return false
        }
    }
}
