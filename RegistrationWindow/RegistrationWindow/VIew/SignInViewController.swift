import UIKit

class SignInViewController: UIViewController, ControlSetupProtocol {
    private var textfieldName = UITextField()
    private var textfieldPassword = UITextField()
    private var infoLabel = UILabel()
    private var registButton = UIButton()
    private var loginButton = UIButton()
    private var acceptLabel = UILabel()
    private var logInImage = UIImage(named: Const.weatherSignInImage)
    private var imageView = UIImageView()
    let defaults = UserDefaults.standard

    
    private var viewModel: SignInViewModel?
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
        setup()
        setupNavBar()
    }
    
    func setupNavBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func setupAutoLoyaut() {
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            textfieldName.topAnchor.constraint(equalTo:imageView.centerYAnchor,constant: Const.textfieldNameTopAnchor),
            textfieldName.rightAnchor.constraint(equalTo: imageView.rightAnchor,constant: Const.textfieldNamerightAnchor),
            textfieldName.widthAnchor.constraint(equalToConstant: Const.textfieldWidthAnchor),
            textfieldName.heightAnchor.constraint(equalToConstant: Const.textfieldHeightAnchor),
            
            textfieldPassword.heightAnchor.constraint(equalToConstant: Const.textfieldHeightAnchor),
            textfieldPassword.widthAnchor.constraint(equalToConstant: Const.textfieldWidthAnchor),
            textfieldPassword.topAnchor.constraint(equalTo: textfieldName.bottomAnchor, constant: Const.textfieldPasswordTopAnchor),
            textfieldPassword.rightAnchor.constraint(equalTo: textfieldName.rightAnchor),
            
            infoLabel.heightAnchor.constraint(equalToConstant: Const.infoLabelHeight),
            infoLabel.widthAnchor.constraint(equalToConstant: Const.infoLabelWidth),
            infoLabel.topAnchor.constraint(equalTo: textfieldName.bottomAnchor, constant: Const.infoLabelBottomAnchor),
            infoLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor,constant: Const.infoLabelLeftAnchor),
            
            registButton.widthAnchor.constraint(equalToConstant: Const.acceptButtonWidth),
            registButton.heightAnchor.constraint(equalToConstant: Const.acceptButtonHeight),
            registButton.topAnchor.constraint(equalTo: textfieldName.topAnchor, constant: Const.acceptButtontopAnchor),
            registButton.rightAnchor.constraint(equalTo: textfieldName.rightAnchor,constant: Const.acceptButtonRightAnchort),
            
            loginButton.widthAnchor.constraint(equalToConstant: Const.loginButtonWidth),
            loginButton.heightAnchor.constraint(equalToConstant: Const.logginButtonHeight),
            loginButton.topAnchor.constraint(equalTo: textfieldName.topAnchor, constant: Const.logginButtontopAnchort),
            loginButton.rightAnchor.constraint(equalTo: textfieldName.rightAnchor,constant: Const.logginButtonRightAnchor),
            
            acceptLabel.bottomAnchor.constraint(equalTo: registButton.bottomAnchor, constant: Const.acceptLabelBottomAnchor),
            acceptLabel.leftAnchor.constraint(equalTo: textfieldName.leftAnchor,constant: Const.acceptLabelLeftAnchor),
            acceptLabel.heightAnchor.constraint(equalToConstant: Const.acceptLabelHeight),
            acceptLabel.widthAnchor.constraint(equalToConstant: Const.acceptLabelWidth)
        ])
    }
    
    func setupSubview() {
        view.addSubviewAndDisableAutoResizing([imageView,
                                               textfieldName,
                                               textfieldPassword,
                                               infoLabel,
                                               registButton,
                                               loginButton,
                                               acceptLabel])
        
    }
    func setupStyle() {
        imageView.image = logInImage
        
        textfieldName.text = UserDefaults.standard.string(forKey: "userRefreshName")
        textfieldName.borderStyle = UITextField.BorderStyle.bezel
        textfieldName.placeholder = Const.registTextFieldName
        textfieldName.backgroundColor = UIColor.white
        textfieldName.layer.borderWidth = 2
        textfieldName.layer.masksToBounds = true
        textfieldName.layer.cornerRadius = 10
        
        textfieldPassword.text = UserDefaults.standard.string(forKey: "userRefreshPassword")
        textfieldPassword.borderStyle = UITextField.BorderStyle.bezel
        textfieldPassword.placeholder = Const.registTextFieldPassword
        textfieldPassword.backgroundColor = UIColor.white
        textfieldPassword.layer.borderWidth = 2
        textfieldPassword.layer.masksToBounds = true
        textfieldPassword.layer.cornerRadius = 10
        
        infoLabel.textColor = .yellow
        infoLabel.font = UIFont.systemFont(ofSize: 30)
        infoLabel.text = Const.registInfoLabelText
        
        registButton.backgroundColor = .none
        registButton.setTitle(Const.registSetTitle, for: .normal)
        registButton.setTitleColor(.yellow, for: .normal)
        
        loginButton.setTitle(Const.logginButtonSetTitle, for: .normal)
        loginButton.setTitleColor(.yellow, for: .normal)
        loginButton.backgroundColor = .none
        
        acceptLabel.textColor = .red
        acceptLabel.isHidden = true
        acceptLabel.font = UIFont.systemFont(ofSize: 20)
        acceptLabel.text = Const.acceptLabelText
        
    }
    
    func setupAction() {
        textfieldName.addTarget(self, action: #selector(hideKeyboard), for: .editingChanged)
        textfieldPassword.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
        textfieldPassword.addTarget(self, action: #selector(passwordChanged), for: .editingDidEndOnExit)
        textfieldName.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        registButton.addTarget(self, action: #selector(tapRegist), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(tapInput), for: .touchUpInside)
    }
    
    
    @objc func hideKeyboard() {
        defaults.setValue(textfieldName.text, forKey: "userRefreshName")
    }
    
    @objc func passwordChanged() {
        defaults.setValue(textfieldPassword.text, forKey: "userRefreshPassword")
    }
    
    @objc func tapRegist() {
        coordinator?.showSignUpPage()
    }
    
    @objc func tapInput() {
        guard let name = textfieldName.text, let password = textfieldPassword.text else { return }
        viewModel?.accept(login: name , password: password)
        viewModel?.comparisonCallback = {equals in
            guard let equal = equals else { return }
            self.acceptLabel.isHidden = equal
        
        }
        defaults.setValue("", forKey: "userRefreshName")
        defaults.setValue("", forKey: "userRefreshPassword")
    }
}

