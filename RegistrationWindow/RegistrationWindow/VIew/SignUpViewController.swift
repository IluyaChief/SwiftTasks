import UIKit

class SignUpViewController: UIViewController, ControlSetupProtocol {
    private var textfieldName = UITextField()
    private var textfieldPassword = UITextField()
    private var acceptButton = UIButton()
    private var infoLabel = UILabel()
    private var signUpImage = UIImage(named: Const.weatherSignUpImage)
    private var imageView = UIImageView()
    private var backButton = UIButton()
    private var viewModel: RegistrationViewModel?
    var coordinator: Coordinator?
    
    init(viewModel: RegistrationViewModel) {
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
            infoLabel.leftAnchor.constraint(equalTo: textfieldName.leftAnchor),
            
            acceptButton.widthAnchor.constraint(equalToConstant: Const.acceptButtonWidth),
            acceptButton.heightAnchor.constraint(equalToConstant: Const.acceptButtonHeight),
            acceptButton.topAnchor.constraint(equalTo: textfieldName.topAnchor, constant: Const.acceptButtontopAnchor),
            acceptButton.rightAnchor.constraint(equalTo: textfieldName.rightAnchor,constant: Const.acceptButtonRightAnchort),
            
            backButton.leftAnchor.constraint(equalTo: acceptButton.leftAnchor),
            backButton.topAnchor.constraint(lessThanOrEqualTo: acceptButton.bottomAnchor),
            backButton.widthAnchor.constraint(equalToConstant: Const.acceptButtonWidth),
            backButton.heightAnchor.constraint(equalToConstant: Const.acceptButtonHeight)
        ])
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
        backButton.setTitleColor(.yellow, for: .normal)
        backButton.backgroundColor = .none
        backButton.layer.cornerRadius = 15
        
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
        acceptButton.setTitleColor(.yellow, for: .normal)
        acceptButton.backgroundColor = .none
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
        if isValid(word: name) == false {
            let allert = UIAlertController(title: Const.allertTitle, message: Const.allertMassage, preferredStyle: UIAlertController.Style.alert)
            allert.addAction(UIAlertAction(title: Const.allertActionTitle, style: UIAlertAction.Style.default, handler: nil))
            present(allert, animated: true, completion: nil)
        } else {
            viewModel?.name = nameText
            viewModel?.password = passwordText
            navigationController?.popViewController(animated: true)
        }
    }
}
