//
//  HomeViewModel.swift
//  HomeViewModel
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation

class HomeViewModel {
    
    private var dataStore : CurrentDayDataStore
    init (dataStore : CurrentDayDataStore) {
        self.dataStore = dataStore
    }
    
    private var currentDayStore : Day {
        dataStore.currentDay
    }
    
    public var currentDay : String {
        currentDayStore.currentDay
    }
    
    public var goalTime : Double {
        currentDayStore.goalTime
    }
    
    public var currentTime : Double {
        currentDayStore.currentTime
    }
    
    public var isGoalAchieve : Bool {
        currentDayStore.isGoalAchieve
    }
    
    

    
    
    
    
    
}
