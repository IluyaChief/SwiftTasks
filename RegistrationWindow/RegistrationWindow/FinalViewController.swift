import UIKit

class FinalViewController: UIViewController {
    private let greetingsLabel = UILabel()
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
            greetingsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
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
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
