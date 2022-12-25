//
//  RegistrationViewModel.swift
//  RegistrationWindow
//
//  Created by MAC on 30.10.2022.
//

import UIKit

class SignOutViewModel {
    private let model: UserModel?
    init(model: UserModel) {
        self.model = model
    }
    
    var name: String? {
        get {
            return model?.name
        } set {
            UserModel.set(text: SettingsKeys.name, value: newValue)
        }
    }
    
    var password: String? {
        get {
            return model?.password
        } set {
            UserModel.set(text: SettingsKeys.password, value: newValue)
        }
    }
}	
