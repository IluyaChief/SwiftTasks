import UIKit

class LastViewController: UIViewController {
    private let tappedButton = UIButton()
    private let imageButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        present()
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        tappedButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tappedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tappedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tappedButton.heightAnchor.constraint(equalToConstant: 50),
            tappedButton.widthAnchor.constraint(equalToConstant: 300),
            
            imageButton.bottomAnchor.constraint(equalTo: tappedButton.topAnchor),
            imageButton.leftAnchor.constraint(equalTo: tappedButton.leftAnchor),
            imageButton.heightAnchor.constraint(equalToConstant: 50),
            imageButton.widthAnchor.constraint(equalToConstant: 300)])
    }
    
    private func present() {
    tappedButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tappedButton.setTitle(Const.backToRoot, for: .normal)
    tappedButton.setTitleColor(.black, for: .normal)
        tappedButton.addTarget(self, action: #selector(tapToRoot), for: .touchUpInside)
        
        imageButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imageButton.setTitle(Const.tapToImage, for: .normal)
        imageButton.setTitleColor(.black, for: .normal)
        imageButton.addTarget(self, action: #selector(tapToImage), for: .touchUpInside)
        
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addSubview() {
        view.addSubview(tappedButton)
        view.addSubview(imageButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func tapToImage() {
        let imageController = ImageController()
        imageController.modalPresentationStyle = .fullScreen
        present(imageController, animated: true, completion: nil)
    }
    
    @objc func tapToRoot() {
        var currentControllerArray = navigationController?.viewControllers
            currentControllerArray?.removeLast(2)
            guard let newController = currentControllerArray else { return }
            self.navigationController?.viewControllers = newController
    }
}
