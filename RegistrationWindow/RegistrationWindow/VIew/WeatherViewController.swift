import UIKit

class WeatherViewController: UIViewController {
    private let greetingsLabel = UILabel()
    var viewModel: WeatherViewModel?
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
        view.backgroundColor = .blue
        setupSubview()
        setupAutoLoyaut()
        setupStyle()
    }
    private func setupAutoLoyaut() {
        greetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greetingsLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            greetingsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            greetingsLabel.widthAnchor.constraint(equalToConstant: 400),
            greetingsLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupSubview() {
        view.addSubview(greetingsLabel)
    }
    
    private func setupStyle() {
        greetingsLabel.text = "you are inside"
        greetingsLabel.font = UIFont.systemFont(ofSize: 50)
        greetingsLabel.textColor = .yellow
        greetingsLabel.alpha = 0
        UIView.animate(withDuration: 2) {
            self.greetingsLabel.alpha = 1
            self.greetingsLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.greetingsLabel.textColor = .systemOrange
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
