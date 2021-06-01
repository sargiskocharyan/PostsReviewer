//
//  PostCoordinator.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import UIKit

protocol PostsFlow: class {
    func goToDetailView(userId: Int, body: String, title: String)
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
        navigationController.pushViewController(postViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    func goToDetailView(userId: Int, body: String, title: String) {
        let detailCoordinator = PostDetailCoordinator(navigationController: navigationController, userId: userId, body: body, title: title)
        coordinate(to: detailCoordinator)
    }
}
