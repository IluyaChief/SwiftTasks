import UIKit

protocol ControlSetupProtocol {
    func setupSubview()
    func setupAutoloyaut()
    func setupStyle()
    func setupAction()
}

extension ControlSetupProtocol {
    func controlSetup() {
        setupSubview()
        setupAutoloyaut()
        setupStyle()
        setupAction()
    }
}

enum Const {
    static let colorArray = [UIColor.red, UIColor.green, UIColor.blue, UIColor.yellow, UIColor.darkGray, UIColor.orange]
    static let lessonLabelTopAnchor: CGFloat = -500
    static let lessonLabelLeftAnchor: CGFloat = 20
    static let shapeSize: CGFloat = 300
    static let startButtonBottomAnchor: CGFloat = -100
    static let startButtonHeight: CGFloat = 70
    static let startButtonWidth: CGFloat = 300
    static let changeButtonBottomAnchor: CGFloat = -30
    static let changeButtonHeight: CGFloat = 50
    static let changeButtonWidth: CGFloat = 200
    static let ButtonRadius: CGFloat = 20
    static let changeButtonTitle = "Plus 10"
    static let startButtonTitle = "Start"
    static let shapeViewImageName = "elipse"
    static let shapeViewCornerRadius: CGFloat = 30
    static let shapeViewShadowRadius: CGFloat = 5
    static let timerLabelText = "10"
    static let timerLabelFontSize: CGFloat = 80
    static let labelLines = 0
    static let lessonLabelText = "Timer of training KVC and KVO"
    static let lessonLabelFintSize: CGFloat = 24
    static let animationKeyPath = "strokeEnd"
    static let shapeLayerAnimationRoad = "basicAnimation"
}
