//
//  EditGoalTimeViewController.swift
//  EditGoalTimeViewController
//
//  Created by Adrien Cullier on 22/09/2021.
//

import Foundation
import UIKit

class EditGoalTimeViewController : UIViewController {
    
    var editGoalTimeView = EditGoalTimeView()
    var delegate : EditGoalTimeViewControllerDelegate?
    var viewModel : EditGoalTimeViewModel
    init (viewModel : EditGoalTimeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configureView()
        
    }
    
    
    private func configureView () {
        editGoalTimeView = EditGoalTimeView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(editGoalTimeView)
        editGoalTimeView.configureView()
        editGoalTimeView.goalTimePickerView.delegate = self
        editGoalTimeView.goalTimePickerView.dataSource = self
        editGoalTimeView.validateButton.addTarget(self, action: #selector(validateButtonDidTapped), for: .touchUpInside)
    }
    @objc func validateButtonDidTapped() {
        viewModel.goalTimeOfTheDay = getGoalTimeFromPickerView()
        delegate?.validateButtonDidTapped(viewModel)
    }
    
    private func getGoalTimeFromPickerView() -> Double {
        var newGoalTime = 0.0
        let hoursToSecond = editGoalTimeView.goalTimePickerView.selectedRow(inComponent: 0) * 3600
        let minutesToSecond = editGoalTimeView.goalTimePickerView.selectedRow(inComponent: 1) * 60
        let seconds = editGoalTimeView.goalTimePickerView.selectedRow(inComponent: 2)
        newGoalTime = Double(hoursToSecond + minutesToSecond + seconds)
        return newGoalTime
    }

}

var hours : [Int] = {
    var hours : [Int] = []
    for x in 0...24 {
        hours.append(x)
    }
    return hours
}()
var minutes : [Int] = {
    var minutes : [Int] = []
    for x in 0...59 {
        minutes.append(x)
    }
    return minutes
}()
var seconds : [Int] = {
    var seconds : [Int] = []
    for x in 0...59 {
        seconds.append(x)
    }
    return seconds
}()

extension EditGoalTimeViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        50
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        75
    }
}
extension EditGoalTimeViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0 :
            return hours.count
        case 1 :
            return minutes.count
        case 2 :
            return seconds.count
        default :
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
        case 0 :
            return "\(String(format: "%.2d", hours[row])) h"
        case 1 :
            return "\(String(format: "%.2d", minutes[row])) m"
        case 2 :
            return "\(String(format: "%.2d", seconds[row])) s"
        default :
            return ""
        }
        
        
    }
    
}

