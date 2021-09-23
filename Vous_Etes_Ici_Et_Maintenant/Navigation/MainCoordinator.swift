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
        homeCoordinator.delegate = self
        return homeCoordinator
    }()
    
    lazy var editGoalTimeCoordinator : EditGoalTimeCoordinator = {
        let editGoalTimeCoordinator = EditGoalTimeCoordinator(navigationController: navigationController, dataStore: dataStore)
        editGoalTimeCoordinator.delegate = self
        return editGoalTimeCoordinator
    }()
    
    func start() {
        homeCoordinator.start()
    }
    
    
}

extension MainCoordinator : CoordinatorDelegate {
    func putCurrentTimeDoneToZero() {
        dataStore.updateCurrentTime(newValue: 0)
        let homeViewModel = HomeViewModel(dataStore: dataStore)
        self.homeCoordinator.viewController?.viewModel = homeViewModel
        self.homeCoordinator.viewController?.reloadView()
    }
    
    func reloadHomeView() {
        print("reload")
        let homeViewModel = HomeViewModel(dataStore: dataStore)
        self.homeCoordinator.viewController?.viewModel = homeViewModel
        self.homeCoordinator.viewController?.reloadView()
    }
    
    func dismissEditGoalTimeView() {
        editGoalTimeCoordinator.dismiss()
        
    }
    
    
    func updateGoalTimeDataStore(goalTime: Double) {
        print ("updated")
        dataStore.updateGoalTime(newValue: goalTime)
    }
    
    func showEditGoalTime() {
        editGoalTimeCoordinator.start()
    }
    
    func updateAllDataStore(_ viewModel: HomeViewModel) {
        dataStore.updateDataStore(dayName: viewModel.currentDayName, isGoalAchieve: viewModel.isGoalAchieve, goalTime: viewModel.goalTimeOfTheDay, currentTime: viewModel.currentDoneTimeOfTheDay)
    }
    
    
}

