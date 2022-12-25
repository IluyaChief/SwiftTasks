import UIKit

class WeatherViewController: UIViewController, ControlSetupProtocol {
    private let greetingsLabel = UILabel()
    private let weaterImage = UIImage(named: Const.weatherPageImage)
    private let imageView = UIImageView()
    private var viewModel: WeatherViewModel?
    var coordinator: AppCoordinator?
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavBar()
}
    
    func setupNavBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
     func setupAutoLoyaut() {
        greetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            greetingsLabel.topAnchor.constraint(equalTo: imageView.topAnchor,constant: Const.textfieldWidthAnchor),
            greetingsLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: Const.greetingsLabelLeftAnchor),
            greetingsLabel.widthAnchor.constraint(equalToConstant: Const.greetingsLabelwidthAnchor),
            greetingsLabel.heightAnchor.constraint(equalToConstant: Const.greetingsLabelLeftAnchor)
        ])
    }
    
     func setupSubview() {
        view.addSubviewAndDisableAutoResizing([imageView,
                                                greetingsLabel])

    }
    
     func setupStyle() {
        imageView.image = weaterImage
        
        greetingsLabel.text = Const.greetingsLabelText
        greetingsLabel.font = UIFont.systemFont(ofSize: 50)
        greetingsLabel.textColor = .yellow
        greetingsLabel.alpha = 0
        UIView.animate(withDuration: 2) {
            self.greetingsLabel.alpha = 1
            self.greetingsLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.greetingsLabel.textColor = .systemOrange
        }
    }
    
    func setupAction() {
        
    }
}
