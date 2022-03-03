import UIKit

class ViewController: UIViewController {
    var textLabel = UILabel()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .brown
            view.addSubview(textLabel)
            heroInfoLabel()
        }

        private func heroInfoLabel() {
            textLabel.frame = CGRect(x: 300, y: 300, width: 350, height: 500)
            textLabel.center = self.view.center
            textLabel.numberOfLines = 0
            let fontSize = self.textLabel.font.pointSize
            textLabel.font = UIFont(name: "Chalkduster", size: fontSize)
        }
}

