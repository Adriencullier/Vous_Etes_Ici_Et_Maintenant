//
//  CurrentDayDataStoreTest.swift
//  CurrentDayDataStoreTest
//
//  Created by Adrien Cullier on 20/09/2021.
//

import XCTest
@testable import Vous_Etes_Ici_Et_Maintenant

class CurrentDayDataStoreTest: XCTestCase {

    func testGivenCurrentDayDayNameIsAnyDay_WhenTodaysDateIsTuesday_ThenCurrentDayDayNameIsTuesday () {
        let currentDataStore = CurrentDayDataStore()
        
        currentDataStore.today = "Tuesday 10"
        
//        XCTAssertEqual(currentDataStore.currentDay.currentDay, "Tuesday 10")
    }
}
