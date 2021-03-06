//
//  HomeViewController.swift
//  HomeViewController
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation
import UIKit
import AudioToolbox


class HomeViewController : UIViewController {
    
    var timer = Timer()
    var timerIsPlayed = false
    var delegate : HomeViewControllerDelegate?
    
    
    var viewModel: HomeViewModelProtocol
    init (_ viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    var homeView : HomeView?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
       
        setupView()
       
        
    }
    
    private func setupView () {
        homeView = HomeView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(self.homeView!)
        homeView?.configureHomeView(viewModel, timerIsPlayed: timerIsPlayed)
        
        homeView?.playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        homeView?.stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        
        homeView?.changeGoalTimeButton.addTarget(self, action: #selector(changeGoalTimeButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func playButtonTapped () {
        
        timerIsPlayed.toggle()
        reloadView()
        
        if timerIsPlayed == true {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
        else {
            timer.invalidate()
            delegate?.pauseButtonDidTapped(viewModel)
        }
    }
    
    @objc func stopButtonTapped () {
        timerIsPlayed = false
        timer.invalidate()
        delegate?.stopButtonDidTapped()
    }
    
    @objc func timerAction(){
        viewModel.currentDoneTimeOfTheDay += 1
        viewModel.timeLeftOfTheDayDouble -= 1
        
        if viewModel.timeLeftOfTheDayDouble <= 0 {
            timer.invalidate()
            AudioServicesPlaySystemSound(viewModel.soundWhenTimeIsDone)
            viewModel.timeLeftOfTheDayDouble = 0
        }
        reloadView()
    }
    
    @objc func changeGoalTimeButtonTapped () {
        timerIsPlayed = false
        timer.invalidate()
        delegate?.changeGoalTimeButtonTapped()
    }
    
    public func reloadView() {
        homeView?.configureHomeView(viewModel, timerIsPlayed: timerIsPlayed)
    }
    
    
    
    
    
}
