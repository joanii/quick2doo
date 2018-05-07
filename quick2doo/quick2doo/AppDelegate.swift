//
//  AppDelegate.swift
//  quick2doo
//
//  Created by Joan Disho on 09.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        print(Constants.Realm.localRealmURL)
        configureGlobalUISettings()
        let sceneCoordinator = SceneCoordinator(window: window!)
        SceneCoordinator.shared = sceneCoordinator
        let rootScene = Scene.taskList(TasksViewModel(sceneCoordinator: sceneCoordinator))
        sceneCoordinator.transition(to: rootScene, type: .root)
        
        // MARK: Load Data
        TaskService().loadData()
        
        return true
    }
    
    private func configureGlobalUISettings() {
        UINavigationBar.appearance().tintColor = Constants.Color.textWhite
        UINavigationBar.appearance().barTintColor = Constants.Color.blackZ
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barStyle = .black
    }

}

