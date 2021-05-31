//
//  PostCoordinator.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/26/21.
//

import UIKit

protocol PostsFlow: class {
    func coordinateToDetailView(userId: Int, body: String, title: String)
}

class PostsCoordinator: Coordinator, PostsFlow {
    let navigationController: UINavigationController
    let storyBoardIdentifier: String = "post"
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let postViewController = PostsViewController.instantiate(fromAppStoryboard: .main)
        postViewController.coordinator = self
        postViewController.viewModel = PostsViewModel()
        postViewController.title = "posts".localized()
        navigationController.navigationBar.barTintColor = UIColor(red: 0/255, green: 130/255, blue: 255/255, alpha: 1)
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.pushViewController(postViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    func coordinateToDetailView(userId: Int, body: String, title: String) {
        let detailCoordinator = PostDetailCoordinator(navigationController: navigationController, userId: userId, body: body, title: title)
        coordinate(to: detailCoordinator)
    }
}
