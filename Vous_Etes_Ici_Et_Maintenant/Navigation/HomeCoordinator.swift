//
//  HomeCoordinator.swift
//  HomeCoordinator
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation
import UIKit

class HomeCoordinator : Coordinator {
    
    var viewController: UIViewController?
    var navigationController: UINavigationController
    var dataStore : CurrentDayDataStore
    init (_ navigationController: UINavigationController, _ dataStore : CurrentDayDataStore) {
        self.navigationController = navigationController
        self.dataStore = dataStore
        let homeViewModel = HomeViewModel(dataStore: dataStore)
        viewController = HomeViewController(homeViewModel)
    }
    
    func start() {
        navigationController.pushViewController(self.viewController!, animated: false)
    }
    
    
}
