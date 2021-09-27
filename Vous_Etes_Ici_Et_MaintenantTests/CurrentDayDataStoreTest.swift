//
//  CurrentDayDataStoreTest.swift
//  CurrentDayDataStoreTest
//
//  Created by Adrien Cullier on 20/09/2021.
//

import XCTest
@testable import Vous_Etes_Ici_Et_Maintenant

class CurrentDayDataStoreTest: XCTestCase {
    
    var testCurrentDayDataStore : CurrentDayDataStore!
    
    override func setUp() {
        testCurrentDayDataStore = CurrentDayDataStore()
    }
    override func tearDown() {
        testCurrentDayDataStore = nil
    }
    
    func testUpdateDataStore () {
        /// Given currentDay
        /// When currentDayDataStore is updated
        let dayName = testCurrentDayDataStore.today
        let isGoalAchieve = true
        let goalTime = 25
        let currentTime = 5
        testCurrentDayDataStore.updateDataStore(dayName: dayName, isGoalAchieve: isGoalAchieve, goalTime: Double(goalTime), currentTime: Double(currentTime))
        
        /// Then current Day must be
        let expectedDay = Day (dayName: dayName, isGoalAchieve: isGoalAchieve, goalTime: Double(goalTime), currentTime: Double(currentTime))
        
        XCTAssertEqual(testCurrentDayDataStore.currentDay.dayName, expectedDay.dayName)
        XCTAssertEqual(testCurrentDayDataStore.currentDay.isGoalAchieve, expectedDay.isGoalAchieve)
        XCTAssertEqual(testCurrentDayDataStore.currentDay.goalTime, expectedDay.goalTime)
        XCTAssertEqual(testCurrentDayDataStore.currentDay.currentTime, expectedDay.currentTime)
        
        
    }

}
