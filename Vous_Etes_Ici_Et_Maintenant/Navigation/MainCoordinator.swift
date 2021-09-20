//
//  MainCoordinator.swift
//  MainCoordinator
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation
import UIKit

class MainCoordinator : Coordinator {
    
    let dataStore = CurrentDayDataStore()
    
    var viewController: UIViewController?
    var navigationController: UINavigationController
    init (_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    lazy var homeCoordinator : HomeCoordinator = {
        let homeCoordinator = HomeCoordinator(self.navigationController, dataStore)
        return homeCoordinator
    }()
    
    func start() {
        homeCoordinator.start()
    }
    
    
}
