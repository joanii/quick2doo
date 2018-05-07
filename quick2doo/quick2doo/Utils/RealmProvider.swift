//
//  RealmProvider.swift
//  quick2doo
//
//  Created by Joan Disho on 09.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmProvider {
    var defaultRealm: Realm { get }
    func performRealmOperation(_ operation: String, action: (Realm) -> Void) -> Bool 
}

extension RealmProvider {
    
    @discardableResult func performRealmOperation(_ operation: String, action: (Realm) -> Void) -> Bool {
        do {
            let realm = defaultRealm
            try realm.write {
                action(realm)
            }
            return true
        } catch let err {
            print("Failed \(operation) realm with error: \(err)")
            return false
        }
    }
    
}

class LocalRealmProvider: RealmProvider {
    
    var defaultRealm: Realm {
        let configuration = Realm.Configuration(fileURL: Constants.Realm.localRealmURL, inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: nil, readOnly: false, schemaVersion: 0, migrationBlock: nil, deleteRealmIfMigrationNeeded: true, shouldCompactOnLaunch: nil, objectTypes: nil)

        return try! Realm(configuration: configuration)
    }
    
}
