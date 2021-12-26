
import UIKit

class ViewController: UIViewController {
    let textFieldStyle = CustomTextFieldView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textFieldStyle)
        setupAutoLayout()
        
        textFieldStyle.focusWillBeLost = { textFieldResult in print("Focus Will Be lost")}
        
        textFieldStyle.textChanged = { textFieldResult in print ("text has changed")}
        
        textFieldStyle.returnTapped = { tapped in print("tapped return")}
         
        textFieldStyle.focusedForTextField = { focused in print ("focus return")}
    }
    

    func setupAutoLayout() {
        textFieldStyle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldStyle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStyle.widthAnchor.constraint(equalToConstant: 200),
            textFieldStyle.heightAnchor.constraint(equalToConstant: 35),
            textFieldStyle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
