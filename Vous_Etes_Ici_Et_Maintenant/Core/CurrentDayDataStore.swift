//
//  CurrentDayDataStore.swift
//  CurrentDayDataStore
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation

protocol CurrentDayDataStoreProtocol {
    var currentDay : Day {get}
    func updateDataStore (dayName : String, isGoalAchieve : Bool, goalTime : Double, currentTime : Double)
    func updateDayName (newValue : String)
    func updateIsGoalAchieve (newValue : Bool)
    func updateGoalTime (newValue : Double)
    func updateCurrentTime (newValue : Double)
    
}

class CurrentDayDataStore : CurrentDayDataStoreProtocol {
    
    /// When the class is initialized, if today and the storedDay are != it creates and store the new day
    init() { initToday() }
    
    internal lazy var today : String = getToday()
    
    public lazy var currentDay : Day = {
        let currentDay = Day(dayName: dayName, isGoalAchieve: isGoalAchieve, goalTime: goalTimeOfTheDay, currentTime: currentTime)
        return currentDay
    }()
        
    public private(set) var dayName : String = UserDefaults.standard.object(forKey: "currentDay") as? String ?? "Default"
    
    public private(set) var isGoalAchieve : Bool = UserDefaults.standard.object(forKey: "isGoalAchieve") as? Bool ?? false {
        
        willSet {
            UserDefaults.standard.set(newValue as Bool, forKey: "isGoalAchieve")
        }
    }
    
    public private(set) var goalTimeOfTheDay : Double = UserDefaults.standard.object(forKey: "goalTime") as? Double ?? 0 {
        willSet {
            UserDefaults.standard.set(newValue, forKey: "goalTime")
        }
    }
    
    public private(set) var currentTime : Double = UserDefaults.standard.object(forKey: "currentTime") as? Double ?? 0 {
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
    
    public func updateDayName (newValue : String) {
        UserDefaults.standard.set(today, forKey: "currentDay")
    }
    
    public func updateIsGoalAchieve (newValue : Bool) {
        self.isGoalAchieve = newValue
    }
    
    public func updateGoalTime (newValue : Double) {
        self.goalTimeOfTheDay = newValue
    }
    
    public func updateCurrentTime (newValue : Double) {
        self.currentTime = newValue
    }
    
    /// 1- Check if today is different of the current day Stored
    /// 2- If today is different, it creates a new Day
    private func initToday () {
        let today = getToday()
        if self.currentDay.dayName != today {
        todayIsANewDay()
        }
    }
    
    /// Create a new Day with the right name of today and Default goalTime, currentTime and GoalIsAchieve
    /// TO DO : Default goalTime, currentTime and GoalIsAchieve must provide from Userdata
    private func todayIsANewDay() {
        let today = getToday()
        self.updateDataStore(dayName: today, isGoalAchieve: false, goalTime: 15, currentTime: 0)
    }
    
    /// Get today Date
    /// - Returns: formated string like "Lundi 20 septembre"
    public func getToday () -> String {
        let today = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "EEEE d MMMM"
        dateFormat.locale = Locale(identifier: "FR")
        let dayFromToDay = dateFormat.string(from: today)
        return dayFromToDay
    }
    
}




