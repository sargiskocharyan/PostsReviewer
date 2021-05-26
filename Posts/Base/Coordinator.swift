//
//  Coordinator.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import Foundation

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
