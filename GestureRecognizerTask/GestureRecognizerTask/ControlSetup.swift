import UIKit

protocol ControlSetupProtocol {
    func setupSubview()
    func setupAutoLayout()
    func setupStyle()
}

extension ControlSetupProtocol {
    func controlSetup() {
        setupSubview()
        setupAutoLayout()
        setupStyle()
    }
}

enum Const {
    static let dotSize: CGFloat = 10
    static let tapGestureInfo = 1
}
