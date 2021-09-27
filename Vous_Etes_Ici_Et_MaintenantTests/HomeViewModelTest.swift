//
//  HomeViewModelTest.swift
//  HomeViewModelTest
//
//  Created by Adrien Cullier on 27/09/2021.
//

import XCTest
@testable import Vous_Etes_Ici_Et_Maintenant

class HomeViewModelTest: XCTestCase {
    
    var mockCurrentDataStore : CurrentDayDataStoreProtocol!
    var homeViewModel : HomeViewModelProtocol!
    
    class MockCurrentDataStore : CurrentDayDataStoreProtocol {
        func updateDataStore(dayName: String, isGoalAchieve: Bool, goalTime: Double, currentTime: Double) {
            
        }
        
        func updateDayName(newValue: String) {
            
        }
        
        func updateIsGoalAchieve(newValue: Bool) {
            
        }
        
        func updateGoalTime(newValue: Double) {
            
        }
        
        func updateCurrentTime(newValue: Double) {
            
        }
        
        var currentDay: Day = Day(dayName: "Lundi 4 mars", isGoalAchieve: true, goalTime: 45, currentTime: 18)
    }
    
    override func setUp()  {
        mockCurrentDataStore = MockCurrentDataStore()
        homeViewModel = HomeViewModel(dataStore: mockCurrentDataStore)
    }
    
    override func tearDown()  {
        mockCurrentDataStore = nil
        homeViewModel = nil
    }
    
    func testHomeViewModel () {
        XCTAssertEqual(homeViewModel.currentDayName, "Lundi 4 mars")
        XCTAssertEqual(homeViewModel.isGoalAchieve, true)
        XCTAssertEqual(homeViewModel.goalTimeOfTheDayDouble, 45)
        XCTAssertEqual(homeViewModel.currentDoneTimeOfTheDay, 18)
        XCTAssertEqual(homeViewModel.timeLeftOfTheDayDouble, 27)
        XCTAssertEqual(homeViewModel.goalTimeOfTheDayLiteralString, "45 secondes")
        XCTAssertEqual(homeViewModel.timeLeftOfTheDayTimerString, "00:27")
    }
    
    
}
