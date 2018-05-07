//
//  SceneCoordinatorType.swift
//  quick2doo
//
//  Created by Joan Disho on 09.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import UIKit
import RxSwift

protocol SceneCoordinatorType {
    init(window: UIWindow)
    
    @discardableResult func transition(to scene: Scene, type: SceneTransitionType) -> Observable<Void>
    @discardableResult func pop(animated: Bool) -> Observable<Void>
}
