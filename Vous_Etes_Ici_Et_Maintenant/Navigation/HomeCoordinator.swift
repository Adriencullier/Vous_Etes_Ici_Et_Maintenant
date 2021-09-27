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
    var dataStore : CurrentDayDataStoreProtocol
    init (_ navigationController: UINavigationController, _ dataStore : CurrentDayDataStoreProtocol) {
        self.navigationController = navigationController
        self.dataStore = dataStore
        let homeViewModel : HomeViewModelProtocol = HomeViewModel(dataStore: dataStore)
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
    
    func pauseButtonDidTapped(_ viewModel : HomeViewModelProtocol) {
        delegate?.updateAllDataStore(viewModel)
    }
    
    
}
