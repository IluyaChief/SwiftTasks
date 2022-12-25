import UIKit

class SignInViewController: UIViewController, ControlSetupProtocol {
    private var textfieldName = UITextField()
    private var textfieldPassword = UITextField()
    private var infoLabel = UILabel()
    private var registButton = UIButton()
    private var loginButton = UIButton()
    private var logInImage = UIImage(named: Const.weatherSignInImage)
    private var imageView = UIImageView()

    
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
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        textfieldName.pinToEdges(view: imageView,
                                 topConst: Const.textfieldNameTopAnchor,
                                 rightConst: Const.textfieldNamerightAnchor,
                                 heightConst: Const.textfieldHeightAnchor,
                                 widthConst: Const.textfieldWidthAnchor)
        textfieldPassword.pinToEdges(view: textfieldName,
                                     topConst: Const.textfieldPasswordTopAnchor,
                                     rightConst: 0,
                                     heightConst: Const.textfieldHeightAnchor,
                                     widthConst: Const.textfieldWidthAnchor)
        infoLabel.pinToEdges(view: textfieldName,
                             topConst: Const.infoLabelBottomAnchor,
                             rightConst: 140,
                             heightConst: Const.infoLabelHeight,
                             widthConst: Const.infoLabelWidth)
        registButton.pinToEdges(view: textfieldName,
                                topConst: Const.acceptButtontopAnchor,
                                rightConst: Const.acceptButtonRightAnchort,
                                heightConst: Const.acceptButtonHeight,
                                widthConst: Const.acceptButtonWidth)
        loginButton.pinToEdges(view: registButton,
                              topConst: Const.buttonTopConstant,
                              rightConst: 0,
                              heightConst: Const.acceptButtonHeight,
                              widthConst: Const.acceptButtonWidth)
    }
    
    func setupSubview() {
        view.addSubviewAndDisableAutoResizing([imageView,
                                               textfieldName,
                                               textfieldPassword,
                                               infoLabel,
                                               registButton,
                                               loginButton])
        
    }
    func setupStyle() {
        imageView.image = logInImage
        
        textfieldName.borderStyle = UITextField.BorderStyle.bezel
        textfieldName.placeholder = Const.registTextFieldName
        textfieldName.backgroundColor = UIColor.white
        textfieldName.layer.borderWidth = 2
        textfieldName.layer.masksToBounds = true
        textfieldName.layer.cornerRadius = 10
        
        textfieldPassword.borderStyle = UITextField.BorderStyle.bezel
        textfieldPassword.placeholder = Const.registTextFieldPassword
        textfieldPassword.backgroundColor = UIColor.white
        textfieldPassword.layer.borderWidth = 2
        textfieldPassword.layer.masksToBounds = true
        textfieldPassword.layer.cornerRadius = 10
        
        infoLabel.textColor = .yellow
        infoLabel.font = UIFont.systemFont(ofSize: 30)
        infoLabel.text = Const.registInfoLabelText
        
        registButton.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        registButton.setTitle(Const.registSetTitle, for: .normal)
        registButton.setTitleColor(.black, for: .normal)
        registButton.layer.cornerRadius = 10
        
        loginButton.setTitle(Const.logginButtonSetTitle, for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        loginButton.layer.cornerRadius = 10
    }
    
    func setupAction() {
        textfieldPassword.addTarget(self, action: #selector(passwordChanged), for: .editingDidEndOnExit)
        textfieldName.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        registButton.addTarget(self, action: #selector(tapRegist), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(tapInput), for: .touchUpInside)
    }
    
    
    @objc func hideKeyboard() {
    }
    
    @objc func passwordChanged() {
    }
    
    @objc func tapRegist() {
        coordinator?.showSignUpPage()
    }
    
    @objc func tapInput() {
        guard let name = textfieldName.text, let password = textfieldPassword.text else { return }
        viewModel?.accept(login: name , password: password)
        viewModel?.comparisonCallback = {equals in
            guard let equal = equals else { return }
            if equal == false {
                let allert = UIAlertController(title: Const.allertTitle,
                                               message: Const.allertmassage,
                                               preferredStyle: UIAlertController.Style.alert)
                allert.addAction(UIAlertAction(title: Const.allertActionTitle, style: UIAlertAction.Style.default,
                                               handler: nil))
                self.present(allert, animated: true, completion: nil)
            }
        }
    }
}

