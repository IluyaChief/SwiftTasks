//
//  RegistrationViewModel.swift
//  RegistrationWindow
//
//  Created by MAC on 30.10.2022.
//

import UIKit

class RegistrationViewModel {
    var model: UserModel?
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
    
    init(model: UserModel) {
        self.model = model
    }
    
    func validation() {
    }
}
