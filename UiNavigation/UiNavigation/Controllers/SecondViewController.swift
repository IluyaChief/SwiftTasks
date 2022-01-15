import UIKit

class SecondViewController: UIViewController {
    private let rootButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        present()
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        rootButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rootButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rootButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rootButton.heightAnchor.constraint(equalToConstant: 50),
            rootButton.widthAnchor.constraint(equalToConstant: 300)])
    }
    
    private func present() {
    rootButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        rootButton.setTitle(Const.inLastController, for: .normal)
    rootButton.setTitleColor(.black, for: .normal)
        rootButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addSubview() {
        view.addSubview(rootButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func didTapButton() {
        let lastVC = LastViewController()
        navigationController?.pushViewController(lastVC, animated: true)
    }
}
