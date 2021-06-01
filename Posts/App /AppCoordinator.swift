//
//  AppCoordinator.swift
//
//  Created by Sargis Kocharyan on 5/31/21.
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
        let startCoordinator = PostsCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}
