//
//  AppCoordinator.swift
//  RegistrationWindow
//
//  Created by MAC on 30.10.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startSignInPage() {
        let model = UserModel()
        let viewModel = SignInViewModel(model: model, signInActionCallback: { [weak self] action in
            switch action {
            case.pushToRegistrationPage:
                self?.showInput()
            }
        })
        let vc = SignInViewController(viewModel: viewModel)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showSignUpPage() {
        let model = UserModel()
        let viewModel = RegistrationViewModel(model: model)
        let vc = SignUpViewController(viewModel: viewModel)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showInput() {
        let model = WeatherModel()
        let viewMidel = WeatherViewModel(model: model)
        let vc = WeatherViewController(viewModel: viewMidel)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
