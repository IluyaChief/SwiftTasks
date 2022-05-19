import UIKit

class ViewController: UIViewController {
   private let textView: UITextView = {
        let text = UITextView()
        text.text = "Apps are often implemented as a set of use cases. Use cases are also known as acceptance criteria, or behaviors, and describe what an app is meant to do. Maybe a list needs to be sortable by date, type, or name. That's a use case. A use case is the layer of an application that is responsible for business logic. Use cases should be independent from the user interface implementation of them. They should also be small and well-defined. Deciding how to break down a complex app into smaller use cases is challenging and requires practice, but it's a helpful way to limit the scope of each problem you are solving and each class that you are writing.Building an app with VIPER involves implementing a set of components to fulfill each use case. Application logic is a major part of implementing a use case, but it's not the only part.The use case also affects the user interface. Additionally, it's important to consider how the use case fits together with other core components of an application, such as networking and data persistence. Components act like plugins to the use cases, and VIPER is a way of describing what the role of each of these components is and how they can interact with one another.One of the use cases or requirements for our to-do list app was to group the to-dos in different ways based on a user's selection. By separating the logic that organizes that data into a use case, we are able to keep the user interface code clean and easily wrap the use case in tests to make sure it continues to work the way we expect it to."
        text.font = UIFont.boldSystemFont(ofSize: 25)
        text.textColor = .black
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let secondView: UIView = {
        let textView = UIView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let keyHideKeyboard: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("Hide", for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraint()
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

extension ViewController {
    func setConstraint() {
        scrollView.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            textView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            textView.heightAnchor.constraint(equalToConstant: 400),
            textView.widthAnchor.constraint(equalToConstant: 400)
        ])
        
        secondView.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
            scrollView.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 800),
            scrollView.widthAnchor.constraint(equalToConstant: 800)
        ])
        
        view.addSubview(secondView)
        NSLayoutConstraint.activate([
            secondView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            secondView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondView.heightAnchor.constraint(equalToConstant: 800),
            secondView.widthAnchor.constraint(equalToConstant: 800)
        ])
        view.addSubview(keyHideKeyboard)
            NSLayoutConstraint.activate([
                keyHideKeyboard.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                keyHideKeyboard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                keyHideKeyboard.heightAnchor.constraint(equalToConstant: 20),
                keyHideKeyboard.widthAnchor.constraint(equalToConstant: 200)
            ])
    }
}
