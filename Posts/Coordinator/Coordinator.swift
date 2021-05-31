//
//  Coordinator.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/26/21.
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
