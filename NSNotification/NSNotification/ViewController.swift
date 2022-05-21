import UIKit


class ViewController: UIViewController, ControlSetupProtocol {
    
    private let textView = UITextView()
    private let scrollView = UIScrollView()
    private let keyHideKeyboard = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controlSetup()
    }
    
    func setupSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(textView)
        view.addSubview(keyHideKeyboard)
    }
    
    func setupAutoLayout() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        keyHideKeyboard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            textView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            textView.heightAnchor.constraint(equalToConstant: Const.textViewSize),
            textView.widthAnchor.constraint(equalToConstant: Const.textViewSize),
            
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: Const.scrollViewSize),
            scrollView.widthAnchor.constraint(equalToConstant: Const.scrollViewSize),
            
            keyHideKeyboard.topAnchor.constraint(equalTo: view.topAnchor, constant: Const.keyboardButtonTopAnchor),
            keyHideKeyboard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keyHideKeyboard.heightAnchor.constraint(equalToConstant: Const.keyboardHideButtonHeight),
            keyHideKeyboard.widthAnchor.constraint(equalToConstant: Const.keyboardHideButtonWidth)
        ])
    }
    
    func setupStyle() {
        keyHideKeyboard.layer.cornerRadius = Const.keyboardHideButtonCornerRadius
        keyHideKeyboard.setTitle(Const.keyboardHideTitle, for: .normal)
        keyHideKeyboard.backgroundColor = .black
        
        textView.font = UIFont.boldSystemFont(ofSize: Const.textViewFontSize)
        textView.textColor = .black
        textView.textAlignment = .center
        textView.text = MockData.textViewInfo
    }
    
    func setupActions() {
        registrForKeyboardNotification()
        keyHideKeyboard.addTarget(self, action: #selector(tapButton), for: .touchUpInside )
    }
    
    @objc func tapButton() {
        textView.resignFirstResponder()
    }
    
    private func registrForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?NSValue)?.cgRectValue {
            scrollView.contentOffset = CGPoint(x: 0, y: keyboardSize.height / 2)
        }
    }
    
    @objc func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }
}

