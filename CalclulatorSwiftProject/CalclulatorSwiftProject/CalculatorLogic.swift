import UIKit

class CalculatorLogic : UIViewController {
    enum Const {
        static let noInfoPercent = "no info"
        static let pointInLabel = "."
        static let clearButtonZero = "0"
        static let equalCurrentValue = "pressed value"
        static let equalSecondValue = "non pressed"
        static let divideZero = "mustn't"
        static let zeroAfterPoint = "no point info"
        static let  numberOfZero = "%.0f"
        static let divide = "/"
        static let multyply = "Х"
        static let plus = "+"
        static let minus = "-"
    }
    
    var pointIsReady = true
    var firstValue: String = ""
    var secondValue: String = ""
    var currentValue: String = ""
    var mathSign: String = ""
    var resultValue: String = ""
    var stillTyping = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    func tappedPercent(_ value : String) -> String {
        guard let labelValue = Double(value) else { return  Const.noInfoPercent }
        let operandTwo = labelValue * 0.01
        self.resultValue = String(operandTwo)
        return self.resultValue
    }
    
    func tappedPoint() -> String {
        firstValue = firstValue + Const.pointInLabel
        pointIsReady = false
        return firstValue
    }
    
    func tappedDigits(_ text: String) -> String {
        let value = text
        if self.stillTyping {
            self.firstValue = self.firstValue + value
        } else {
            self.firstValue = text
            self.stillTyping = true
    }
        return firstValue
}
    
    func clearTapped() -> String {
        self.secondValue = ""
        self.resultValue = ""
        self.mathSign = ""
        self.currentValue = ""
        self.stillTyping = false
        self.pointIsReady = true
        return Const.clearButtonZero
    }
    
    func tappedMathSign(_ sign: String) -> String {
        if stillTyping {
        self.currentValue = firstValue
        } else {
            currentValue = resultValue
        }
        self.stillTyping = false
        self.mathSign = sign
        return self.mathSign
    }
    
    func tappedEqual () -> String {
        self.stillTyping = false
        self.secondValue = self.firstValue
        guard let equalValue = Double(self.currentValue) else { return Const.equalCurrentValue }
        guard let equalLastValue = Double(self.secondValue) else { return Const.equalSecondValue }
        switch self.mathSign {
        case Const.plus:
            self.resultValue = String(equalValue + equalLastValue)
        case Const.minus:
            self.resultValue = String(equalValue - equalLastValue)
        case Const.divide:
            if equalLastValue != 0 {
            self.resultValue =  String(equalValue / equalLastValue)
            } else {
                resultValue = Const.divideZero
            }
        case Const.multyply:
            self.resultValue = String(equalValue * equalLastValue)
        default:
            self.resultValue = self.firstValue
        }
        if pointIsReady{
            guard let resultValueString = Double(resultValue)  else { return Const.zeroAfterPoint }
            self.resultValue = String(format: Const.numberOfZero, resultValueString)
        }
        return self.resultValue
    }
}



