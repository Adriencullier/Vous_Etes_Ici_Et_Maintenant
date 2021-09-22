//
//  HomeViewController.swift
//  HomeViewController
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation
import UIKit

class HomeViewController : UIViewController {
    
    var timer = Timer()
    
    
    var viewModel: HomeViewModel
    init (_ viewModel: HomeViewModel) {
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
        homeView?.configureHomeView(viewModel)
        homeView?.playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        homeView?.pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
    }
    
    @objc func playButtonTapped () {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        

    }
    
    @objc func pauseButtonTapped () {
        timer.invalidate()
    }
    
   
    @objc func timerAction(){      
        viewModel.currentDoneTimeOfTheDay += 0.01
        if String(format: "%.2f", viewModel.currentDoneTimeOfTheDay) == String(format: "%.2f", viewModel.subGoalTime) || String(format: "%.2f", viewModel.currentDoneTimeOfTheDay) == String(format: "%.2f", viewModel.goalTimeOfTheDay)  {
            timer.invalidate()
            viewModel.currentDoneTimeOfTheDay += 0.01
        }
        reloadView()
//        homeView?.configureHomeView(viewModel)
    }
    
    private func reloadView() {
        homeView?.circularProgressView.animatingCircularPath(startPointCurrentTime: viewModel.currentDoneTimeOfTheDay/viewModel.goalTimeOfTheDay)
        
    }
    
    
    
    
    
}
