import UIKit

class TabBarFirstController: UIViewController {
    private let buttonToFirstView = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondAddSubview()
        secondPresent()
        setupAutoLayout()
    }
    
    private func secondAddSubview() {
        view.addSubview(buttonToFirstView)
    }
    
    private func secondPresent() {
        buttonToFirstView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonToFirstView.setTitle(Const.fitstContoller, for: .normal)
        buttonToFirstView.setTitleColor(.black, for: .normal)
        buttonToFirstView.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}
    
    private func setupAutoLayout() {
        buttonToFirstView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonToFirstView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonToFirstView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonToFirstView.heightAnchor.constraint(equalToConstant: 50),
            buttonToFirstView.widthAnchor.constraint(equalToConstant: 300),])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func popViewController() {
        let firstVc = FirstViewController()
        navigationController?.pushViewController(firstVc, animated: true)
    }
}
