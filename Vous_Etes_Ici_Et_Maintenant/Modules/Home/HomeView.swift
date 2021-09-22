//
//  HomeView.swift
//  HomeView
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation
import UIKit

class HomeView : UIView {
    
    var dayLabel : UILabel = {
        let dayLabel = UILabel()
        dayLabel.textAlignment = .center
        dayLabel.textColor = .black
        dayLabel.contentMode = .scaleToFill
        return dayLabel
    }()
    
    var currentTimeLabel : UILabel = {
        let currentTimeLabel = UILabel()
        currentTimeLabel.textAlignment = .center
        currentTimeLabel.numberOfLines = 0
        currentTimeLabel.textColor = .black
        return currentTimeLabel
    }()

    var goalTimeOfTheDayLabel : UILabel = {
        let goalTimeOfTheDayLabel = UILabel()
        goalTimeOfTheDayLabel.textAlignment = .center
        goalTimeOfTheDayLabel.numberOfLines = 0
        goalTimeOfTheDayLabel.textColor = .black
        return goalTimeOfTheDayLabel
    }()
    
    var playButton : UIButton = {
        let playButton = UIButton()

        return playButton
    }()
    
    var circularProgressView : CircularProgressView = {
        let circularProgressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        return circularProgressView
    }()
    
    var changeGoalTimeButton : UIButton = {
        let changeGoalTimeButton = UIButton()
        changeGoalTimeButton.setTitle("Change d'objectif", for: .normal)
        changeGoalTimeButton.setTitleColor(.blue, for: .normal)
        return changeGoalTimeButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dayLabel)
        addSubview(currentTimeLabel)
        addSubview(goalTimeOfTheDayLabel)
        addSubview(circularProgressView)
        addSubview(playButton)
        addSubview(changeGoalTimeButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configureHomeView(_ viewModel : HomeViewModel,  timerIsPlayed : Bool){
        
        setupConstraints()
        self.circularProgressView.createCircularPath()
        
        dayLabel.text = viewModel.currentDayName
        goalTimeOfTheDayLabel.text = convertTotalSecondsToString(totalSeconds: Int(viewModel.goalTimeOfTheDay))
        currentTimeLabel.text = convertTotalSecondsToString(totalSeconds: Int(viewModel.timeLeftOfTheDay))

        circularProgressView.animatingCircularPath(startPointCurrentTime: viewModel.currentDoneTimeOfTheDay/viewModel.goalTimeOfTheDay)
        
        if timerIsPlayed == true {
            self.playButton.setImage(UIImage(systemName: "pause"), for: .normal)
        }
        else {
            self.playButton.setImage(UIImage(systemName: "play"), for: .normal)
        }
        
    }
    
    
    private func convertTotalSecondsToString (totalSeconds : Int) -> String {
        let hours : Int = {totalSeconds/3600}()
        let minutes : Int = {(totalSeconds % 3600) / 60}()
        let seconds : Int = {(totalSeconds % 3600) % 60}()
        
        var timeString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        if hours < 1 {
            timeString = String(format: "%02d:%02d", minutes, seconds)
        }
        return timeString
    }
    
    private func setupConstraints(){
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dayLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        dayLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        currentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTimeLabel.centerXAnchor.constraint(equalTo: circularProgressView.centerXAnchor).isActive = true
        currentTimeLabel.centerYAnchor.constraint(equalTo: circularProgressView.centerYAnchor).isActive = true

        
        goalTimeOfTheDayLabel.translatesAutoresizingMaskIntoConstraints = false
        goalTimeOfTheDayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        goalTimeOfTheDayLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 20).isActive = true
        goalTimeOfTheDayLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        goalTimeOfTheDayLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        circularProgressView.translatesAutoresizingMaskIntoConstraints = false
        circularProgressView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        circularProgressView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        circularProgressView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.centerXAnchor.constraint(equalTo: circularProgressView.centerXAnchor).isActive = true
        playButton.topAnchor.constraint(equalTo: currentTimeLabel.bottomAnchor, constant: 8).isActive = true
        
        changeGoalTimeButton.translatesAutoresizingMaskIntoConstraints = false
        changeGoalTimeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        changeGoalTimeButton.topAnchor.constraint(equalTo: circularProgressView.bottomAnchor).isActive = true
  
    }
    
}
