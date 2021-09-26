//
//  HomeViewModelTest.swift
//  HomeViewModelTest
//
//  Created by Adrien Cullier on 26/09/2021.
//

import XCTest
@testable import Vous_Etes_Ici_Et_Maintenant

class HomeViewModelTest: XCTestCase {

    class TestDataStore : CurrentDayDataStoreProtocol {
        var currentDay: Day = Day(dayName: "Lundi", isGoalAchieve: false, goalTime: 15, currentTime: 0)
    }
    
    let homeViewModel = HomeViewModel(dataStore: TestDataStore())
    func testCurrentDayName () {
        XCTAssertEqual(homeViewModel.currentDayName, "Lundi")
    }

}
