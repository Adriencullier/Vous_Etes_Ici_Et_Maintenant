//
//  EditGoalTimeView.swift
//  EditGoalTimeView
//
//  Created by Adrien Cullier on 22/09/2021.
//

import Foundation
import UIKit

class EditGoalTimeView : UIView {
    
    var goalTimePickerView : UIPickerView = {
        let goalTimePickerView = UIPickerView()
        return goalTimePickerView
    }()
    
    var validateButton : UIButton = {
        let validateButton = UIButton()
        validateButton.setTitle("ok", for: .normal)
        validateButton.setTitleColor(.blue, for: .normal)
        return validateButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(goalTimePickerView)
        addSubview(validateButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        goalTimePickerView.translatesAutoresizingMaskIntoConstraints = false
        goalTimePickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        goalTimePickerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        validateButton.translatesAutoresizingMaskIntoConstraints = false
        validateButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        validateButton.topAnchor.constraint(equalTo: goalTimePickerView.bottomAnchor).isActive = true

    }
    
    public func configureView () {
        self.backgroundColor = .white
        setupConstraints()
    }
    
    
    
}
