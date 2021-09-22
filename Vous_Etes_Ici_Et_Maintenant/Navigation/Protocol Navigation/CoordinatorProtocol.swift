//
//  CoordinatorProtocol.swift
//  CoordinatorProtocol
//
//  Created by Adrien Cullier on 20/09/2021.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController : UINavigationController {get}
    func start()
}
