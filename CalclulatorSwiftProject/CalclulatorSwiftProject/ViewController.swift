
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var calculatorFunction = CalculatorLogic()
    
    @IBAction func percentTapButton(_ sender: UIButton) {
        resultLabel.text = calculatorFunction.tappedPercent(resultLabel.text ?? "")
    }
    
    @IBAction func pointTappedButton(_ sender: UIButton) {
        resultLabel.text = calculatorFunction.tappedPoint()
    }
    
    @IBAction func userPressedButton(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        resultLabel.text = calculatorFunction.tappedDigits(number)
    }
    
    @IBAction func clearTappedButton(_ sender: UIButton) {
        resultLabel.text = calculatorFunction.clearTapped()
    }
    
    @IBAction func userTapSignButton(_ sender: UIButton) {
        guard let sign = sender.currentTitle else { return }
        resultLabel.text = calculatorFunction.tappedMathSign(sign)
    }
    
    @IBAction func userTapEqualButton(_ sender: UIButton) {
        resultLabel.text = calculatorFunction.tappedEqual()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            if UIDevice.current.orientation.isLandscape {
                resultLabel.font = UIFont.systemFont(ofSize: 60)
                resultLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            } else {
                resultLabel.font = UIFont.systemFont(ofSize: 40)
                resultLabel.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            }
        }
    }
