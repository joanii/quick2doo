//
//  TaskItem.swift
//  quick2doo
//
//  Created by Joan Disho on 09.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import Foundation
import RealmSwift
import RxDataSources

class TaskItem: Object {
    
    @objc dynamic var uid: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var added: Date = Date()
    @objc dynamic var checked: Date? = nil
    
    override class func primaryKey() -> String? {
        return "uid"
    }
}

extension TaskItem: IdentifiableType {
    var identity: Int {
        return self.isInvalidated ? 0 : uid
    }
}
