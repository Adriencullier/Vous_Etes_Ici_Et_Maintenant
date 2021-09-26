//
//  HomeViewModel.swift
//  HomeViewModel
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation
import AVFoundation

class HomeViewModel {
    
    private var dataStore : CurrentDayDataStoreProtocol
    init (dataStore : CurrentDayDataStoreProtocol) {
        self.dataStore = dataStore
    }

    public var currentDayName : String  {
        dataStore.currentDay.dayName
    }
    
    public lazy var goalTimeOfTheDay : Double = {
        dataStore.currentDay.goalTime
    }()
    
    public lazy var subGoalTime : Double = 0
    
    public lazy var timeLeftOfTheDay : Double = {
        var timeLeftOfTheDay = goalTimeOfTheDay - currentDoneTimeOfTheDay
        return timeLeftOfTheDay
    }()
    
    
  
    public lazy var currentDoneTimeOfTheDay : Double = {
        dataStore.currentDay.currentTime
    }()
    
    public lazy var currentDoneTimeStored : Double = {
        dataStore.currentDay.currentTime
    }()
    
    
    public var isGoalAchieve : Bool {
        dataStore.currentDay.isGoalAchieve
    }
    
    public var soundWhenTimeIsDone : SystemSoundID {
        
        let systemSoundId : SystemSoundID = 1027
        return systemSoundId
        
    }
    
    

    
    
    
    
    
}
