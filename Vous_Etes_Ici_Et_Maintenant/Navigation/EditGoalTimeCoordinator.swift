//
//  EditGoalTimeCoordinator.swift
//  EditGoalTimeCoordinator
//
//  Created by Adrien Cullier on 22/09/2021.
//

import Foundation
import UIKit

class EditGoalTimeCoordinator : Coordinator {
    
    var viewController : EditGoalTimeViewController?
    var navigationController: UINavigationController
    var dataStore : CurrentDayDataStoreProtocol
    init (navigationController: UINavigationController, dataStore : CurrentDayDataStoreProtocol) {
        self.navigationController = navigationController
        self.dataStore = dataStore
        let editGoalTimeViewModel = EditGoalTimeViewModel(dataStore: dataStore)
        self.viewController = EditGoalTimeViewController(viewModel: editGoalTimeViewModel)
        self.viewController?.delegate = self
    }
    var delegate : CoordinatorDelegate?
    
    func start() {
        navigationController.present(viewController!, animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true) {
            self.delegate?.reloadHomeView()
        }
    }
    
    
}

extension EditGoalTimeCoordinator : EditGoalTimeViewControllerDelegate {
    func validateButtonDidTapped(_ viewModel: EditGoalTimeViewModel) {
        delegate?.updateGoalTimeDataStore(goalTime: viewModel.goalTimeOfTheDay)
        delegate?.dismissEditGoalTimeView()
    }
    
    
    
    
}
