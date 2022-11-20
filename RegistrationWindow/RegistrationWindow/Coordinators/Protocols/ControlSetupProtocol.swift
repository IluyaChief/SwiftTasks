//
//  ControlSetupProtocol.swift
//  RegistrationWindow
//
//  Created by MAC on 07.11.2022.
//

import UIKit


protocol ControlSetupProtocol {
    func setupSubview()
    func setupAutoLoyaut()
    func setupStyle()
    func setupAction()
}

extension ControlSetupProtocol {
    func setup() {
        setupSubview()
        setupAutoLoyaut()
        setupStyle()
        setupAction()
    }
}

