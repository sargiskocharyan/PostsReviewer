//
//  SecondCoordinator.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/26/21.
//

import UIKit

protocol PostDetailFlow: class {

}

class PostDetailCoordinator: Coordinator, PostDetailFlow {
    let navigationController: UINavigationController
    let userId: Int?
    let body: String?
    let title: String?
    
    init(navigationController: UINavigationController, userId: Int, body: String, title: String) {
        self.navigationController = navigationController
        self.userId = userId
        self.body = body
        self.title = title
    }
    
    func start() {
        let vc = PostDetailViewController.instantiate(fromAppStoryboard: .main)
        vc.viewModel = PostDetailViewModel()
        vc.userId = userId
        vc.body = body
        vc.postTitle = title
        navigationController.navigationBar.tintColor = UIColor.white
        navigationController.pushViewController(vc, animated: true)
    }
    
}
