//
//  HomeViewModel.swift
//  HomeViewModel
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation
import AVFoundation

protocol HomeViewModelProtocol {
    var currentDayName : String                 {get set}
    var goalTimeOfTheDayDouble : Double         {get set}
    var subGoalTime : Double                    {get set}
    var timeLeftOfTheDayDouble : Double         {get set}
    var currentDoneTimeOfTheDay : Double        {get set}
    var currentDoneTimeStored : Double          {get set}
    var isGoalAchieve : Bool                    {get set}
    var goalTimeOfTheDayLiteralString : String  {get}
    var timeLeftOfTheDayTimerString : String    {get}
    var soundWhenTimeIsDone : SystemSoundID     {get}
}


class HomeViewModel : HomeViewModelProtocol {
    
    
    
    private var dataStore : CurrentDayDataStoreProtocol
    init (dataStore : CurrentDayDataStoreProtocol) {
        self.dataStore = dataStore
    }
    
    public lazy var currentDay : Day = {
        dataStore.currentDay
    }()

    public lazy var currentDayName : String = {
        dataStore.currentDay.dayName
    }()
    
    public lazy var goalTimeOfTheDayDouble : Double = {
        dataStore.currentDay.goalTime
    }()
    
    public var goalTimeOfTheDayLiteralString : String {
        let goalTimeDouble = goalTimeOfTheDayDouble
        let goalTimeLiteralString = convertTotalSecondsToLiteralString(totalSeconds: Int(goalTimeDouble))
        return goalTimeLiteralString
    }
    
    public lazy var subGoalTime : Double = 0
    
    public lazy var timeLeftOfTheDayDouble : Double = {
        var timeLeftOfTheDay = goalTimeOfTheDayDouble - currentDoneTimeOfTheDay
        return timeLeftOfTheDay
    }()
    
    public var timeLeftOfTheDayTimerString : String {
        let timeLeftOfTheDayDouble = timeLeftOfTheDayDouble
        let timeLeftTimerString = convertTotalSecondsToTimerString(totalSeconds: Int(timeLeftOfTheDayDouble))
        return timeLeftTimerString
    }
    
    
  
    public lazy var currentDoneTimeOfTheDay : Double = {
        dataStore.currentDay.currentTime
    }()
    
    public lazy var currentDoneTimeStored : Double = {
        dataStore.currentDay.currentTime
    }()
    
    
    public lazy var isGoalAchieve : Bool = {
        dataStore.currentDay.isGoalAchieve
    }()
    
    public var soundWhenTimeIsDone : SystemSoundID {
        
        let systemSoundId : SystemSoundID = 1027
        return systemSoundId
        
    }
    
    private func convertTotalSecondsToLiteralString (totalSeconds : Int) -> String {
        let hours : Int = {totalSeconds/3600}()
        let minutes : Int = {(totalSeconds % 3600) / 60}()
        let seconds : Int = {(totalSeconds % 3600) % 60}()
        
        var timeString = String(format: "%01d heures et %01d minutes", hours, minutes)
        if hours < 1 {
            if minutes < 1 {
                timeString = String(format: "%01d secondes", seconds)
            }
            else {timeString = String(format: "%01d minutes", minutes)}
        }
        if hours > 1 && minutes < 1 {
            timeString = String(format: "%01d heures", hours)
        }
        
        return timeString
    }
    
    private func convertTotalSecondsToTimerString (totalSeconds : Int) -> String {
        let hours : Int = {totalSeconds/3600}()
        let minutes : Int = {(totalSeconds % 3600) / 60}()
        let seconds : Int = {(totalSeconds % 3600) % 60}()
        
        var timeString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        if hours < 1 {
            timeString = String(format: "%02d:%02d", minutes, seconds)
        }
        return timeString
    }
    
    

    
    
    
    
    
}
