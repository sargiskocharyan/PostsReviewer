//
//  PostCoordinator.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import UIKit

protocol PostFlow: class {
    func coordinateToDetailView()
}

class PostCoordinator: Coordinator, PostFlow {
    let navigationController: UINavigationController
    let storyBoardIdentifier: String = "post"
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let postViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyBoardIdentifier) as! PostViewController
        postViewController.coordinator = self
        postViewController.viewModel = PostViewModel()
        navigationController.pushViewController(postViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    func coordinateToDetailView() {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
        coordinate(to: detailCoordinator)
    }
}
