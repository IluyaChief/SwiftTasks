import UIKit

class ViewController: UIViewController, ControlSetupProtocol {
    
    @objc  let lessonLabel = UILabel()
    private let timerLabel = UILabel()
    private let shapeView = UIImageView()
    private let startButton = UIButton()
    private  let changeButton = UIButton()
    private var timer = Timer()
    private let shapeLayer = CAShapeLayer()
    @objc dynamic var durationTimer = 10
    private let colors = Const.colorArray
    var nameObservationToken :NSKeyValueObservation?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.animationCircular()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controlSetup()
    }
    
    func setupSubview() {
        view.addSubview(lessonLabel)
        view.addSubview(shapeView)
        shapeView.addSubview(timerLabel)
        view.addSubview(startButton)
        view.addSubview(changeButton)
    }
    
    func setupAutoloyaut() {
        lessonLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        shapeView.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lessonLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Const.lessonLabelTopAnchor),
            lessonLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            lessonLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Const.lessonLabelLeftAnchor),
            
            shapeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shapeView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shapeView.heightAnchor.constraint(equalToConstant: Const.shapeSize),
            shapeView.widthAnchor.constraint(equalToConstant: Const.shapeSize),
            
            timerLabel.centerXAnchor.constraint(equalTo: shapeView.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: shapeView.centerYAnchor),
            
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Const.startButtonBottomAnchor),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: Const.startButtonHeight),
            startButton.widthAnchor.constraint(equalToConstant: Const.startButtonWidth),
            
            changeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Const.changeButtonBottomAnchor),
            changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeButton.heightAnchor.constraint(equalToConstant: Const.changeButtonHeight),
            changeButton.widthAnchor.constraint(equalToConstant: Const.changeButtonWidth)
        ])
    }
    
    func setupStyle() {
        changeButton.layer.cornerRadius = Const.ButtonRadius
        changeButton.setTitle(Const.changeButtonTitle, for: .normal)
        changeButton.backgroundColor = .black
        
        startButton.layer.cornerRadius = Const.ButtonRadius
        startButton.setTitle(Const.startButtonTitle, for: .normal)
        startButton.backgroundColor = .black
        
        shapeView.image = UIImage(named: Const.shapeViewImageName)
        shapeView.layer.cornerRadius = Const.shapeViewCornerRadius
        shapeView.layer.shadowRadius = Const.shapeViewShadowRadius
        
        timerLabel.text = Const.timerLabelText
        timerLabel.font = UIFont.boldSystemFont(ofSize: Const.timerLabelFontSize)
        timerLabel.textColor = .black
        timerLabel.numberOfLines = Const.labelLines
        timerLabel.textAlignment = .center
        
        lessonLabel.text = Const.lessonLabelText
        lessonLabel.font = UIFont.boldSystemFont(ofSize: Const.lessonLabelFintSize)
        lessonLabel.textColor = .black
        lessonLabel.numberOfLines = Const.labelLines
        lessonLabel.textAlignment = .center
    }
    
    func setupAction() {
        nameObservationToken = observe(\ViewController.durationTimer, options: [.new]) { object, change in
            guard let updateName = change.newValue else { return }
            object.timerLabel.text = String(updateName)
            object.lessonLabel.text = String(updateName)
            self.timerLabel.textColor = self.colors.shuffled().first
            self.lessonLabel.textColor = self.colors.shuffled().first
        }
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        changeButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
    }
    
    @objc func changeButtonTapped() {
        durationTimer += 10
    }
    
    @objc func startButtonTapped() {
        basicAnimation()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        durationTimer -= 1
        timerLabel.text = "\(durationTimer)"
        if durationTimer == 0 {
            timer.invalidate()
        }
    }
    
    //MARK: Animation
    private func animationCircular() {
        let center = CGPoint(x: shapeView.frame.width / 2, y: shapeView.frame.height / 2)
        let endAngle = (-CGFloat.pi / 2)
        let startAngle = 2 * CGFloat.pi + endAngle
        let circularPath = UIBezierPath(arcCenter: center, radius: 138, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 21
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeView.layer.addSublayer(shapeLayer)
    }
    
    private func basicAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: Const.animationKeyPath)
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(durationTimer)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = true
        shapeLayer.add(basicAnimation, forKey: Const.shapeLayerAnimationRoad)
    }
}
