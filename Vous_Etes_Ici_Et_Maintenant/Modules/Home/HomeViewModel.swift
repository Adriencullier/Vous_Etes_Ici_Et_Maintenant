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

    public var currentDayName : String  {
        dataStore.currentDay.dayName
    }
    
    public lazy var goalTimeOfTheDay : Double = {
        dataStore.currentDay.goalTime
    }()
    
    public lazy var timeLeftOfTheDay : Double = {
        goalTimeOfTheDay - currentDoneTimeOfTheDay
    }()
    
    
  
    public lazy var currentDoneTimeOfTheDay : Double = {
        dataStore.currentDay.currentTime
    }()
    
    
    public var isGoalAchieve : Bool {
        dataStore.currentDay.isGoalAchieve
    }
    
    

    
    
    
    
    
}
