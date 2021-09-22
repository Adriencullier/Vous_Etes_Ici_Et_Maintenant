//
//  EditGoalTimeViewModel.swift
//  EditGoalTimeViewModel
//
//  Created by Adrien Cullier on 22/09/2021.
//

import Foundation

class EditGoalTimeViewModel {
    var dataStore : CurrentDayDataStore
    init (dataStore : CurrentDayDataStore) {
        self.dataStore = dataStore
    }
    
    public lazy var goalTimeOfTheDay : Double = {
        dataStore.currentDay.goalTime
    }()
    
}

