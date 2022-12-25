//
//  Coordinators.swift
//  RegistrationWindow
//
//  Created by MAC on 30.10.2022.
//

import UIKit
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func startSignInPage()
}
