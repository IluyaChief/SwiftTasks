import UIKit

class SignUpViewController: UIViewController, ControlSetupProtocol {
    private var textfieldName = UITextField()
    private var textfieldPassword = UITextField()
    private var acceptButton = UIButton()
    private var infoLabel = UILabel()
    private var signUpImage = UIImage(named: Const.weatherSignUpImage)
    private var imageView = UIImageView()
    private var backButton = UIButton()
    private var viewModel: SignOutViewModel?
    var coordinator: Coordinator?
    
    init(viewModel: SignOutViewModel) {
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
                             rightConst: 200,
                             heightConst: Const.infoLabelHeight,
                             widthConst: Const.infoLabelWidth)
        acceptButton.pinToEdges(view: textfieldName,
                                topConst: Const.acceptButtontopAnchor,
                                rightConst: Const.acceptButtonRightAnchort,
                                heightConst: Const.acceptButtonHeight,
                                widthConst: Const.acceptButtonWidth)
        backButton.pinToEdges(view: acceptButton,
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
                                               acceptButton,
                                               backButton
        ])
        
    }
    func setupStyle() {
        imageView.image = signUpImage
        
        backButton.titleLabel?.font = UIFont(name: Const.uiFont, size: 20)
        backButton.setTitle(Const.backButtonSetTitle, for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        backButton.layer.cornerRadius = 10
        
        textfieldName.borderStyle = UITextField.BorderStyle.bezel
        textfieldName.placeholder = Const.textfieldNamePlaceholder
        textfieldName.backgroundColor = UIColor.white
        textfieldName.layer.borderWidth = 2
        textfieldName.layer.masksToBounds = true
        textfieldName.layer.cornerRadius = 10
        
        textfieldPassword.borderStyle = UITextField.BorderStyle.bezel
        textfieldPassword.placeholder = Const.textfieldPasswordPlaceholder
        textfieldPassword.backgroundColor = UIColor.white
        textfieldPassword.layer.borderWidth = 2
        textfieldPassword.layer.masksToBounds = true
        textfieldPassword.layer.cornerRadius = 10
        
        infoLabel.textColor = .yellow
        infoLabel.font = UIFont.systemFont(ofSize: 40)
        infoLabel.text = Const.infoLabelText
        
        acceptButton.titleLabel?.font = UIFont(name: Const.uiFont, size: 20)
        acceptButton.setTitle(Const.acceptButtonSetTitle, for: .normal)
        acceptButton.setTitleColor(.black, for: .normal)
        acceptButton.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        acceptButton.layer.cornerRadius = 9
    }
    
    func setupAction() {
        textfieldName.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        textfieldPassword.addTarget(self, action: #selector(passwordChanged), for: .editingDidEndOnExit)
        textfieldName.addTarget(self, action: #selector(textfieldNameChanged), for: .editingChanged)
        acceptButton.addTarget(self, action: #selector(saveButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func textfieldNameChanged() {
    }
    
    @objc func hideKeyboard() {
        
    }
    
    @objc func passwordChanged() {
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func isValid(word: String) -> Bool {
        let pattern = Const.passwordRegex
        return NSPredicate(format: "Self Matches %@", pattern).evaluate(with: word)
    }
    
    
    @objc func saveButton() {
        let nameText = textfieldName.text?.trimmingCharacters(in: .whitespaces)
        let passwordText = textfieldPassword.text?.trimmingCharacters(in: .whitespaces)
        guard let name =  textfieldName.text else { return }
        if !isValid(word: name) {
            let alert = UIAlertController(title: Const.allertTitle,
                                          message: Const.allertMassage,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: Const.allertActionTitle,
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            viewModel?.name = nameText
            viewModel?.password = passwordText
            navigationController?.popViewController(animated: true)
        }
    }
}
