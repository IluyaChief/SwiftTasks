import UIKit

class RegistController: UIViewController {
    private var textfieldName = UITextField()
    private var textfieldPassword = UITextField()
    private var acceptButton = UIButton()
    private var infoLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
        setupAutoLoyaut()
        setupStyle()
        setupAction()
        view.backgroundColor = .blue
    }
    private func setupAutoLoyaut() {
        textfieldName.translatesAutoresizingMaskIntoConstraints = false
        textfieldPassword.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
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
            infoLabel.widthAnchor.constraint(equalToConstant: 250),
            infoLabel.topAnchor.constraint(equalTo: textfieldName.bottomAnchor, constant: -150),
            infoLabel.leftAnchor.constraint(equalTo: textfieldName.leftAnchor),
            
            acceptButton.widthAnchor.constraint(equalToConstant: 100),
            acceptButton.heightAnchor.constraint(equalToConstant: 30),
            acceptButton.topAnchor.constraint(equalTo: textfieldName.topAnchor, constant: 130),
            acceptButton.rightAnchor.constraint(equalTo: textfieldName.rightAnchor,constant: -50)
        ])
    }
    
    private func setupSubview() {
        view.addSubview(textfieldName)
        view.addSubview(textfieldPassword)
        view.addSubview(infoLabel)
        view.addSubview(acceptButton)
    }
    private func setupStyle() {
        textfieldName.borderStyle = UITextField.BorderStyle.bezel
        textfieldName.placeholder = "Create name"
        textfieldName.backgroundColor = UIColor.white
        
        textfieldPassword.borderStyle = UITextField.BorderStyle.bezel
        textfieldPassword.placeholder = "Create password"
        textfieldPassword.backgroundColor = UIColor.white
        
        infoLabel.textColor = .yellow
        infoLabel.font = UIFont.systemFont(ofSize: 40)
        infoLabel.text = "Registration"
        
        acceptButton.setTitle("Save", for: .normal)
        acceptButton.setTitleColor(.yellow, for: .normal)
        acceptButton.backgroundColor = .systemBlue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = UIColor.blue
    }
        
    private func setupAction() {
        textfieldName.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        textfieldPassword.addTarget(self, action: #selector(passwordChanged), for: .editingDidEndOnExit)
        acceptButton.addTarget(self, action: #selector(saveButton), for: .touchUpInside)
    }
    
    @objc func hideKeyboard() {
        
    }
    
    @objc func passwordChanged() {
    }
    
    @objc func saveButton() {
        navigationController?.popViewController(animated: true)
        let nameText = textfieldName.text?.trimmingCharacters(in: .whitespaces)
        let passwordText = textfieldPassword.text?.trimmingCharacters(in: .whitespaces)
    }
}
