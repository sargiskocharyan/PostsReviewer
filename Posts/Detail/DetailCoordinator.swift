//
//  SecondCoordinator.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import UIKit

protocol DetailFlow: class {

}

class DetailCoordinator: Coordinator, DetailFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailViewController
        vc.viewModel = DetailViewModel()
        vc.userId = 1
        navigationController.pushViewController(vc, animated: true)
    }
    
}
