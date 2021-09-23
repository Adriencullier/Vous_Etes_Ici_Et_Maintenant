//
//  CoordinatorDelegate.swift
//  CoordinatorDelegate
//
//  Created by Adrien Cullier on 22/09/2021.
//

import Foundation

protocol CoordinatorDelegate {
    func updateAllDataStore(_ viewModel : HomeViewModel)
    func dismissEditGoalTimeView ()
    func reloadHomeView()
    func updateGoalTimeDataStore(goalTime : Double)
    func showEditGoalTime()
    func putCurrentTimeDoneToZero()
}
