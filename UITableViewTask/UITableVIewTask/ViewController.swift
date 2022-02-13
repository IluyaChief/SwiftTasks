
import UIKit

class ViewController: UIViewController {
     var textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        view.addSubview(textLabel)
        placeLabel()
    }
    
    private func placeLabel() {
        textLabel.frame = CGRect(x: 300, y: 300, width: 350, height: 500)
        textLabel.center = self.view.center
        textLabel.numberOfLines = 0
        let fontSize = self.textLabel.font.pointSize
        textLabel.font = UIFont(name: Const.fontName, size: fontSize)
    }
}
