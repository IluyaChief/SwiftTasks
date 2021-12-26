
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    var numberOfDouble: Double = 0
    var firstNumber: Double = 0
    var operation: Int = 0
    var MathSign: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func Digits(_ sender: UIButton) {
        if MathSign == true {
            result.text = String(sender.tag)
            MathSign = false
        }
        else {
            result.text = result.text! + String(sender.tag)
        }
        numberOfDouble = Double(result.text!)!
    }
    

    @IBAction func buttonAnyFunction(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 17 && result.text != "/" && result.text != "x" && result.text != "-" && result.text != "+" {
                firstNumber = Double(result.text!)!
                
            
            if sender.tag == 13 {
                    result.text = "/"
                }
                else if sender.tag == 14 {
                    result.text = "*"
                }
                else if sender.tag == 15 {
                    result.text = "-"
                }
                else if sender.tag == 16 {
                    result.text = "+"
                }


            operation = sender.tag
            MathSign = true
            
        }
        else if sender.tag == 17 {
                    if operation == 13 {
                        result.text = String(firstNumber / numberOfDouble)
                    }
                    if operation == 14 {
                        result.text = String(firstNumber * numberOfDouble)
                    }
                    if operation == 15 {
                        result.text = String(firstNumber - numberOfDouble)
                    }
                    if operation == 16 {
                        result.text = String(firstNumber + numberOfDouble)
                    }
                    if operation == 11 {
                        result.text = String(firstNumber.truncatingRemainder(dividingBy: numberOfDouble))
            }
                }
                else if sender.tag == 10 {
                    result.text = ""
                    firstNumber = 0
                    numberOfDouble = 0
                    operation = 0
                }
            }
    }
