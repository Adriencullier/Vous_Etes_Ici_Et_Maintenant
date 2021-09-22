//
//  CurrentDayDataStore.swift
//  CurrentDayDataStore
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation

class CurrentDayDataStore {
    
    init() {
    initToday()
    }
    
    lazy var today = getToday()
    
    public var currentDay : Day {
        let currentDay = Day(dayName: dayName, isGoalAchieve: isGoalAchieve, goalTime: goalTimeOfTheDay, currentTime: currentTime)
        return currentDay
    }
        
    public var dayName : String  {
        let dayNameStored = UserDefaults.standard.object(forKey: "currentDay") as? String ?? "Default"
        
        if dayNameStored == today {
            return dayNameStored
        }
        else {
            todayIsANewDay()
            return UserDefaults.standard.object(forKey: "currentDay") as? String ?? "Default"
        }
    }
    
    private var isGoalAchieve : Bool = UserDefaults.standard.object(forKey: "isGoalAchieve") as? Bool ?? false {
        willSet {
            UserDefaults.standard.set(newValue, forKey: "isGoalAchieve")
        }
    }
    
    private var goalTimeOfTheDay : Double = UserDefaults.standard.object(forKey: "goalTime") as? Double ?? 0 {
        willSet {
            UserDefaults.standard.set(newValue, forKey: "goalTime")
        }
    }
    
    private var currentTime : Double = UserDefaults.standard.object(forKey: "currentTime") as? Double ?? 0 {
        willSet {
            UserDefaults.standard.set(newValue, forKey: "currentTime")
        }
    }
    
    public func updateDataStore (dayName : String, isGoalAchieve : Bool, goalTime : Double, currentTime : Double) {
        updateDayName(newValue: dayName)
        updateIsGoalAchieve(newValue: isGoalAchieve)
        updateGoalTime(newValue: goalTime)
        updateCurrentTime(newValue: currentTime)
    }
    
    private func updateDayName (newValue : String) {
        UserDefaults.standard.set(today, forKey: "currentDay")
    }
    
    private func updateIsGoalAchieve (newValue : Bool) {
        self.isGoalAchieve = newValue
    }
    
    public func updateGoalTime (newValue : Double) {
        self.goalTimeOfTheDay = newValue
    }
    
    private func updateCurrentTime (newValue : Double) {
        self.currentTime = newValue
    }
    
    /// 1- Check if today is different of the current day Stored
    /// 2- If today is different, it creates a new Day
    public func initToday () {
        let today = getToday()
        if self.currentDay.dayName != today {
        todayIsANewDay()
        }
    }
    
    /// Create a new Day with the right name of today and Default goalTime, currentTime and GoalIsAchieve
    /// TO DO : Default goalTime, currentTime and GoalIsAchieve must provide from Userdata
    private func todayIsANewDay() {
        let today = getToday()
        let goalTimeDefault : Double = 15
        let currentTimeDefault : Double = 0
        let isGoalAchieveDefault : Bool = false
        
        self.updateCurrentTime(newValue: currentTimeDefault)
        self.updateGoalTime(newValue: goalTimeDefault)
        self.updateIsGoalAchieve(newValue: isGoalAchieveDefault)
        self.updateDayName(newValue: today)
    }
    
    
    /// Get today Date
    /// - Returns: string like "Lundi 20 septembre"
    private func getToday () -> String {
        let today = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "EEEE d MMMM"
        dateFormat.locale = Locale(identifier: "FR")
        let dayFromToDay = dateFormat.string(from: today)
        return dayFromToDay
    }
    
}




