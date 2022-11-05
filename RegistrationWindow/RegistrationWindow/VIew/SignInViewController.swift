import UIKit

class SignInViewController: UIViewController {
    private var textfieldName = UITextField()
    private var textfieldPassword = UITextField()
    private var infoLabel = UILabel()
    private var registButton = UIButton()
    private var loginButton = UIButton()
    var acceptLabel = UILabel()
    
    var viewModel: SignInViewModel?
    var coordinator: AppCoordinator?
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
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
        acceptLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textfieldName.topAnchor.constraint(equalTo:view.centerYAnchor,constant: -50),
            textfieldName.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -100),
            textfieldName.heightAnchor.constraint(equalToConstant: 40),
            textfieldName.widthAnchor.constraint(equalToConstant: 200),
            
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
            loginButton.rightAnchor.constraint(equalTo: textfieldName.rightAnchor,constant: -50),
            
            acceptLabel.bottomAnchor.constraint(equalTo: registButton.bottomAnchor, constant: -30),
            acceptLabel.leftAnchor.constraint(equalTo: textfieldName.leftAnchor,constant: 45),
            acceptLabel.heightAnchor.constraint(equalToConstant: 30),
            acceptLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupSubview() {
        view.addSubview(textfieldName)
        view.addSubview(textfieldPassword)
        view.addSubview(infoLabel)
        view.addSubview(registButton)
        view.addSubview(loginButton)
        view.addSubview(acceptLabel)
    }
    private func setupStyle() {
        textfieldName.borderStyle = UITextField.BorderStyle.bezel
        textfieldName.placeholder = "press your name"
        textfieldName.backgroundColor = UIColor.white
        
        textfieldPassword.borderStyle = UITextField.BorderStyle.bezel
        textfieldPassword.placeholder = "press your password"
        textfieldPassword.backgroundColor = UIColor.white
        textfieldPassword.isSecureTextEntry = true
        
        infoLabel.textColor = .yellow
        infoLabel.font = UIFont.systemFont(ofSize: 40)
        infoLabel.text = "Hello!"
        
        registButton.backgroundColor = .systemBlue
        registButton.setTitle("Registration", for: .normal)
        registButton.setTitleColor(.yellow, for: .normal)
        
        loginButton.setTitle("Ok", for: .normal)
        loginButton.setTitleColor(.yellow, for: .normal)
        loginButton.backgroundColor = .systemBlue
        
        acceptLabel.textColor = .red
        acceptLabel.isHidden = true
        acceptLabel.font = UIFont.systemFont(ofSize: 20)
        acceptLabel.text = "Wrong data"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupAction() {
        textfieldName.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        textfieldPassword.addTarget(self, action: #selector(passwordChanged), for: .editingDidEndOnExit)
        registButton.addTarget(self, action: #selector(tapRegist), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(tapInput), for: .touchUpInside)
    }
    
    
    @objc func hideKeyboard() {
        
    }
    
    @objc func passwordChanged() {
    }
    
    @objc func tapRegist() {
        coordinator?.showLogin()
    }
    
    @objc func tapInput() {
        guard let name = textfieldName.text, let password = textfieldPassword.text else { return }
        viewModel?.accept(login: name , password: password)
        viewModel?.comparisonCallback = {equals in
            guard let equal = equals else { return }
            self.acceptLabel.isHidden = equal
        }
    }
}
