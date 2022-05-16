import UIKit

class ViewController: UIViewController {
   @objc dynamic let lessonLabel : UILabel = {
        let label = UILabel()
        label.text = "Timer of training KVC and KVO"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timerLabel : UILabel = {
        let label = UILabel()
        label.text = "10"
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shapeView: UIImageView = {
      let imageView = UIImageView()
        imageView.image = UIImage(named: "elipse")
        imageView.layer.cornerRadius = 30
        imageView.layer.shadowRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let startButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let changeButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("Plus 10", for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var timer = Timer()
    @objc dynamic var durationTimer = 10
    let shapeLayer = CAShapeLayer()
    let colors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.yellow, UIColor.darkGray, UIColor.orange]
    var nameObservationToken :NSKeyValueObservation?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.animationCircular()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        nameObservationToken = observe(\ViewController.durationTimer, options: [.new]) { strongself, change in
            guard let updateName = change.newValue else { return }
            strongself.timerLabel.text = String(updateName)
            strongself.lessonLabel.text = String(updateName)
            switch self.timerLabel.text {
            case String(1):
                self.timerLabel.textColor = self.colors.shuffled().first
                self.lessonLabel.textColor = self.colors.shuffled().first
            default :
                self.timerLabel.textColor = self.colors.shuffled().first
                self.lessonLabel.textColor = self.colors.shuffled().first
            }
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
    func animationCircular() {
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
    
    func basicAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(durationTimer)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = true
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
}

extension ViewController {
    func setConstraints() {
        view.addSubview(lessonLabel)
        NSLayoutConstraint.activate([
            lessonLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -500),
            lessonLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            lessonLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        ])
        
        view.addSubview(shapeView)
        NSLayoutConstraint.activate([
            shapeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shapeView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shapeView.heightAnchor.constraint(equalToConstant: 300),
            shapeView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        shapeView.addSubview(timerLabel)
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: shapeView.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: shapeView.centerYAnchor),
        ])
        
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 70),
            startButton.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        view.addSubview(changeButton)
        NSLayoutConstraint.activate([
            changeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeButton.heightAnchor.constraint(equalToConstant: 50),
            changeButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

