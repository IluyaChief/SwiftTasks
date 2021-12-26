import UIKit

class CustomTextFieldView: UIView {
    private var textField = UITextField()
    private var buttonTextField = UIButton()
    private var labelTextField = UILabel()
    private var labelNumber = UILabel()
    private var textLabelBottom = UILabel()
    
    
    var textChanged: ((UITextField?) -> Void)?
    var returnTapped: ((String?) -> Void)?
    var focusedForTextField: ((String?) -> Void)?
    var focusWillBeLost: ((UITextField?) -> Void)?
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAutoLoyautTextFiled()
        buttonOnTextField()
        labelOnTextField()
        labelNumberFunc()
        textFieldLine()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAutoLoyautTextFiled() {
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo:self.topAnchor),
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor),
            textField.leftAnchor.constraint(equalTo: self.leftAnchor),
            textField.heightAnchor.constraint(equalToConstant: 55)
        ])
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.placeholder = "press 6 character"
        textField.addTarget(self, action: #selector(textChanedEdition), for: .editingChanged)
        textField.addTarget(self, action: #selector(focusWillLost), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(tappedReturn), for: .editingDidEndOnExit)
        textField.addTarget(self, action: #selector(returnFocus), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(labelNumberFunc), for: .editingChanged)
    }
    
       private func buttonOnTextField() {
        addSubview(buttonTextField)
        buttonTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonTextField.heightAnchor.constraint(equalToConstant: 15),
            buttonTextField.widthAnchor.constraint(equalToConstant: 15),
            buttonTextField.topAnchor.constraint(equalTo: textField.topAnchor),
            buttonTextField.rightAnchor.constraint(equalTo: textField.rightAnchor)
        ])
        buttonTextField.backgroundColor = .black
        buttonTextField.addTarget(self, action: #selector(textSecurity), for:.touchUpInside)
        
    }
    
    @objc func labelNumberFunc() {
        addSubview(labelTextField)
        labelTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelTextField.heightAnchor.constraint(equalToConstant: 25),
            labelTextField.widthAnchor.constraint(equalToConstant: 25),
            labelTextField.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: -25),
            labelTextField.rightAnchor.constraint(equalTo: textField.rightAnchor)
        ])
        labelTextField.text = String(textField.text!.count)
        labelTextField.textColor = .red
    }
    
    private func labelOnTextField() {
        addSubview(labelNumber)
        labelNumber.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelNumber.topAnchor.constraint(equalTo: textField.topAnchor, constant: 0),
            labelNumber.leftAnchor.constraint(equalTo: textField.leftAnchor)
        ])
        labelNumber.isHidden = true
        labelNumber.textColor = .black
        labelNumber.text = "press 6 character"
        labelNumber.font = UIFont.systemFont(ofSize: 15)
    }
    private func textFieldLine() {
        addSubview(textLabelBottom)
        textLabelBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate ([
            textLabelBottom.topAnchor.constraint(equalTo: textField.bottomAnchor),
            textLabelBottom.widthAnchor.constraint(equalToConstant: 175),
            textLabelBottom.heightAnchor.constraint(equalToConstant: 5)
        ])
        textLabelBottom.isHidden = true
    }
    
    @objc func textChanedEdition(text: UITextField) -> Bool {
        textChanged?(text)
        let textLenght = text.text!.count
        if textLenght < 5 {
        labelNumber.isHidden = false
            textLabelBottom.isHidden = false
            textLabelBottom.backgroundColor = .red
            textField.textColor = .red
        } else if textLenght > 5 {
        labelNumber.isHidden = true
            textLabelBottom.isHidden = false
            textLabelBottom.backgroundColor = .green
            textField.textColor = .none

        }
        return true
    }
    
    @objc func focusWillLost(textField: UITextField) -> Bool {
        focusWillBeLost?(textField)
        let textLenght = textField.text!.count
        if textLenght > 0 {
            textLabelBottom.isHidden = false
            textLabelBottom.backgroundColor = .white
        }
         return true
    }
    
    @objc func tappedReturn() {
        returnTapped?("text")
    }
    
    @objc func returnFocus(text: UITextField) ->Bool {
        focusedForTextField?("text")
        let textLenght = text.text!.count
        if textLenght == 0 {
            textField.placeholder = ""
        }
        if text.isEditing {
            textLabelBottom.isHidden = false
            textLabelBottom.backgroundColor = .green
        }
        return true
    }
    
    @objc func textSecurity(button: UIButton) {
        if button.isTouchInside {
            textField.isSecureTextEntry = true
        }
    }
  }
