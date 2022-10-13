import UIKit

class ViewController: UIViewController {
    private var textfieldName = UITextField()
    private var textfieldPassword = UITextField()
    private var infoLabel = UILabel()
    private var registButton = UIButton()
    private var loginButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
        setupAutoLoyaut()
        setupStyle()
        setupAction()
        view.backgroundColor = .systemBlue
    }
    private func setupAutoLoyaut() {
        textfieldName.translatesAutoresizingMaskIntoConstraints = false
        textfieldPassword.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        registButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textfieldName.topAnchor.constraint(equalTo:view.centerYAnchor,constant: -50),
            textfieldName.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -100),
            textfieldName.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 90),
            textfieldName.heightAnchor.constraint(equalToConstant: 40),
            
            textfieldPassword.heightAnchor.constraint(equalToConstant: 40),
            textfieldPassword.widthAnchor.constraint(equalToConstant: 200),
            textfieldPassword.topAnchor.constraint(equalTo: textfieldName.bottomAnchor, constant: 20),
            textfieldPassword.rightAnchor.constraint(equalTo: textfieldName.rightAnchor),
            
            infoLabel.heightAnchor.constraint(equalToConstant: 60),
            infoLabel.widthAnchor.constraint(equalToConstant: 140),
            infoLabel.topAnchor.constraint(equalTo: textfieldName.bottomAnchor, constant: -150),
            infoLabel.rightAnchor.constraint(equalTo: textfieldName.rightAnchor,constant: -15),
            
            registButton.widthAnchor.constraint(equalToConstant: 100),
            registButton.heightAnchor.constraint(equalToConstant: 30),
            registButton.topAnchor.constraint(equalTo: textfieldName.topAnchor, constant: 130),
            registButton.rightAnchor.constraint(equalTo: textfieldName.rightAnchor,constant: -50),
            
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 30),
            loginButton.topAnchor.constraint(equalTo: textfieldName.topAnchor, constant: 160),
            loginButton.rightAnchor.constraint(equalTo: textfieldName.rightAnchor,constant: -50)
        ])
    }
    
    private func setupSubview() {
        view.addSubview(textfieldName)
        view.addSubview(textfieldPassword)
        view.addSubview(infoLabel)
        view.addSubview(registButton)
        view.addSubview(loginButton)
    }
    private func setupStyle() {
        textfieldName.borderStyle = UITextField.BorderStyle.bezel
        textfieldName.placeholder = "press your name"
        textfieldName.backgroundColor = UIColor.white
        
        textfieldPassword.borderStyle = UITextField.BorderStyle.bezel
        textfieldPassword.placeholder = "press your password"
        textfieldPassword.backgroundColor = UIColor.white
        
        infoLabel.textColor = .yellow
        infoLabel.font = UIFont.systemFont(ofSize: 40)
        infoLabel.text = "Hello!"
        
        registButton.backgroundColor = .systemBlue
        registButton.setTitle("Registration", for: .normal)
        registButton.setTitleColor(.yellow, for: .normal)
        
        loginButton.setTitle("Ok", for: .normal)
        loginButton.setTitleColor(.yellow, for: .normal)
        loginButton.backgroundColor = .systemBlue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupAction() {
        textfieldName.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        textfieldPassword.addTarget(self, action: #selector(passwordChanged), for: .editingDidEndOnExit)
        registButton.addTarget(self, action: #selector(tapRegist), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(tapLogin), for: .touchUpInside)
    }
    
    @objc func hideKeyboard() {
        
    }
    
    @objc func passwordChanged() {
    }
    
    @objc func tapRegist() {
        let regVC = RegistController()
        navigationController?.pushViewController(regVC, animated: true)
    }
    
    @objc func tapLogin() {
            let logVC = FinalViewController()
            navigationController?.pushViewController(logVC, animated: true)
    }
}
