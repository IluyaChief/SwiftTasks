//
//  VIewControllerViewModel.swift
//  RegistrationWindow
//
//  Created by MAC on 30.10.2022.
//

import UIKit

enum SubmitAction {
    case pushToWeatherPage
}

class SignInViewModel {
    typealias SignInActionCallback = (SubmitAction) -> Void
    var signInActionCallback: SignInActionCallback?
    private let model: UserModel?
    var comparisonCallback: ((Bool?) -> Void)?

    
    init(model: UserModel, signInActionCallback: @escaping SignInActionCallback) {
        self.model = model
        self.signInActionCallback = signInActionCallback
    }
    
    func accept(login: String, password: String) {
        if login == model?.name && password == model?.password {
            signInActionCallback?(.pushToWeatherPage)
            comparisonCallback?(true)
        } else {
            comparisonCallback?(false)
        }
    }
}
