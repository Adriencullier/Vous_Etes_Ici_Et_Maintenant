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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dayLabel)
        addSubview(goalTimeLabel)
        addSubview(currentTimeLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureHomeView(_ viewModel : HomeViewModel){
        setupConstraints()
        dayLabel.text = viewModel.currentDay
        goalTimeLabel.text = "Votre objectif du jour est de \(viewModel.goalTime) minutes"
        currentTimeLabel.text = "Vous avez effectué \(viewModel.currentTime) minutes de méditation aujourd'hui"
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
    }
    
}
