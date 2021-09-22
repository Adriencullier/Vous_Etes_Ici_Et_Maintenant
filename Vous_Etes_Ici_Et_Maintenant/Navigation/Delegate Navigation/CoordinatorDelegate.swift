//
//  CoordinatorDelegate.swift
//  CoordinatorDelegate
//
//  Created by Adrien Cullier on 22/09/2021.
//

import Foundation

protocol CoordinatorDelegate {
    func updateDataStore(_ viewModel : HomeViewModel)
    func showEditGoalTime()
}
