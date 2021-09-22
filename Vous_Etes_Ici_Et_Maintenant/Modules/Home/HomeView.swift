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
    
    
    var goalTimeLabel : UILabel = {
        let goalTimeLabel = UILabel()
        goalTimeLabel.textAlignment = .center
        goalTimeLabel.numberOfLines = 0
        goalTimeLabel.textColor = .black
        return goalTimeLabel
    }()

    var currentTimeLabel : UILabel = {
        let currentTimeLabel = UILabel()
        currentTimeLabel.textAlignment = .center
        currentTimeLabel.numberOfLines = 0
        currentTimeLabel.textColor = .black
        return currentTimeLabel
    }()
    
    var playButton : UIButton = {
        let playButton = UIButton()
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(UIColor.black, for: .normal)
        return playButton
    }()
    var pauseButton : UIButton = {
        let pauseButton = UIButton()
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.setTitleColor(UIColor.black, for: .normal)
        return pauseButton
    }()
    
    var circularProgressView : CircularProgressView = {
        let circularProgressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        return circularProgressView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dayLabel)
        addSubview(goalTimeLabel)
        addSubview(currentTimeLabel)
        addSubview(circularProgressView)
        addSubview(playButton)
        addSubview(pauseButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configureHomeView(_ viewModel : HomeViewModel){
        setupConstraints()
        
        self.circularProgressView.createCircularPath(endPointSubGoal: viewModel.currentDoneTimeOfTheDay/viewModel.goalTimeOfTheDay + viewModel.subGoalTime/viewModel.goalTimeOfTheDay)
        
    
        dayLabel.text = viewModel.currentDay
        goalTimeLabel.text = "Votre objectif du jour est de \(viewModel.goalTimeOfTheDay) minutes"
        
    }
    

    
    
    
    private func setupConstraints(){
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dayLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        dayLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        goalTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        goalTimeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        goalTimeLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 20).isActive = true
        goalTimeLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        goalTimeLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        currentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTimeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        currentTimeLabel.topAnchor.constraint(equalTo: goalTimeLabel.bottomAnchor, constant: 20).isActive = true
        currentTimeLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        currentTimeLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        circularProgressView.translatesAutoresizingMaskIntoConstraints = false
        circularProgressView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        circularProgressView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        circularProgressView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.topAnchor.constraint(equalTo: circularProgressView.bottomAnchor).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.topAnchor.constraint(equalTo: playButton.bottomAnchor).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
}
