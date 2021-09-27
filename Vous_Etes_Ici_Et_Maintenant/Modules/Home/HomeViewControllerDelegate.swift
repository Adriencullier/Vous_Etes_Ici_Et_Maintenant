//
//  HomeViewControllerDelegate.swift
//  HomeViewControllerDelegate
//
//  Created by Adrien Cullier on 22/09/2021.
//

import Foundation

protocol HomeViewControllerDelegate {
    func pauseButtonDidTapped(_ viewModel : HomeViewModelProtocol)
    func stopButtonDidTapped()
    func changeGoalTimeButtonTapped ()
}
