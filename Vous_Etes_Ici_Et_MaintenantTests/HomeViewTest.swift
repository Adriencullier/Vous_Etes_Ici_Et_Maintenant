//
//  HomeViewTest.swift
//  HomeViewTest
//
//  Created by Adrien Cullier on 27/09/2021.
//

import XCTest
import AVFoundation

@testable import Vous_Etes_Ici_Et_Maintenant


class HomeViewTest: XCTestCase {

    var homeView : HomeView!
    var mockHomeViewModel : HomeViewModelProtocol!
    
    class MockHomeViewModel : HomeViewModelProtocol {
        var currentDayName: String = "Lundi 26 avril"
        var goalTimeOfTheDayDouble: Double = 17
        var subGoalTime: Double = 0
        var timeLeftOfTheDayDouble: Double = 0
        var currentDoneTimeOfTheDay: Double = 0
        var currentDoneTimeStored: Double = 0
        var isGoalAchieve: Bool = false
        var goalTimeOfTheDayLiteralString: String = "17 min"
        var timeLeftOfTheDayTimerString: String =  "10:04:47"
        var soundWhenTimeIsDone: SystemSoundID = 1780
    }
    
    override func setUp() {
        homeView = HomeView()
        mockHomeViewModel = MockHomeViewModel()
        
    }
    override func tearDown() {
        homeView = nil
        mockHomeViewModel = nil
    }
    
    func testConfigureHomeViewWhenTimerIsPlayedIsFalse(){
        
        homeView.configureHomeView(mockHomeViewModel, timerIsPlayed: false)
        XCTAssertEqual(homeView.dayLabel.text, "Lundi 26 avril")
        XCTAssertEqual(homeView.goalTimeOfTheDayLabel.text, "L'objectif du jour est de \n 17 min")
        XCTAssertEqual(homeView.currentTimeLabel.text, "10:04:47")
    }
}
