import UIKit

class RootController: UIViewController {
   private let tappedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        paramButton()
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        tappedButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tappedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tappedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tappedButton.heightAnchor.constraint(equalToConstant: 50),
            tappedButton.widthAnchor.constraint(equalToConstant: 300)])
    }
    
    private func paramButton() {
    tappedButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tappedButton.setTitle(Const.goToVC1, for: .normal)
    tappedButton.setTitleColor(.black, for: .normal)
        tappedButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addSubview() {
        view.addSubview(tappedButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func didTapButton() {
        let tabBar = TabBarViewController()
        navigationController?.pushViewController(tabBar, animated: true)
    }
}
