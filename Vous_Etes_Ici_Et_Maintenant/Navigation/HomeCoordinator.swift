//
//  HomeCoordinator.swift
//  HomeCoordinator
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation
import UIKit

class HomeCoordinator : Coordinator {
    
    var viewController: HomeViewController?
    var delegate : CoordinatorDelegate?
    var navigationController: UINavigationController
    var dataStore : CurrentDayDataStore
    init (_ navigationController: UINavigationController, _ dataStore : CurrentDayDataStore) {
        self.navigationController = navigationController
        self.dataStore = dataStore
        let homeViewModel = HomeViewModel(dataStore: dataStore)
        viewController = HomeViewController(homeViewModel)
        viewController?.delegate = self
    }
    
    func start() {
        navigationController.pushViewController(self.viewController!, animated: false)
    }
    
    
}

extension HomeCoordinator : HomeViewControllerDelegate {
    func stopButtonDidTapped() {
        delegate?.putCurrentTimeDoneToZero()
    }
    
    func changeGoalTimeButtonTapped() {
        delegate?.showEditGoalTime()
    }
    
    func pauseButtonDidTapped(_ viewModel : HomeViewModel) {
        delegate?.updateAllDataStore(viewModel)
    }
    
    
}
