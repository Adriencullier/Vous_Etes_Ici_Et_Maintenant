//
//  HomeViewController.swift
//  HomeViewController
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation
import UIKit

class HomeViewController : UIViewController {
    
    
    
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
    }
    
    
    
    
    
}
