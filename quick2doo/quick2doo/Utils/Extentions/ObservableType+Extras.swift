//
//  ObservableType+Extras.swift
//  quick2doo
//
//  Created by Joan Disho on 15.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

public protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: OptionalType {
    public var value: Wrapped? {
        return self
    }
}

extension Observable where E == Bool {
    var negate: Observable<Bool> {
        return self.map { !$0 }
    }
    
    func and(_ right: Observable<Bool>) -> Observable<Bool> {
        return Observable.combineLatest(self, right) { $0 && $1 }
    }
    
    func and<O1: Observable<Bool>, O2: Observable<Bool>, O3: Observable<Bool>>(_ source1: O1, _ source2: O2, _ source3: O3) -> Observable<Bool> {
        return source1.and(source2).and(source3)
    }
}

extension Observable where E: OptionalType {
    
    var notNil: Observable<Bool> {
        return self.map { $0.value != nil }
    }
    
    func skipNil() -> Observable<E.Wrapped> {
        return self.filter { $0.value != nil }.map { $0.value! }
    }
}
