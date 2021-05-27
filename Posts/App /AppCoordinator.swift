//
//  AppCoordinator.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        let startCoordinator = PostCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}
