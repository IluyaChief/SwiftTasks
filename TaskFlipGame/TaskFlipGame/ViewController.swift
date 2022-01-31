import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var restartButton: UIButton!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet  internal var flipButtonCollection: [UIButton]!
    private var touches = 0 {
        didSet {
            countLabel.text = "Touches: \(touches)"
            UIView.animate(withDuration: 1, delay: 0, options: []) {
                switch self.lookTouch {
                case 1 :
                    self.countLabel.transform = CGAffineTransform(scaleX: 2, y: 2)
                    self.countLabel.textColor = UIColor.red
                    break
                case 2 :
                    self.countLabel.transform = CGAffineTransform(rotationAngle: .pi)
                    self.countLabel.textColor = UIColor.blue
                    break
                default:
                    self.countLabel.transform = CGAffineTransform.identity
                    self.countLabel.textColor = UIColor.green
                }
            }
            if self.lookTouch > 2 {
                self.lookTouch = 0
            }
        }
    }
    private var lookTouch = 1
    private lazy var gameLogic = GameLogic(numberOfPairsCard: numberOfPairsCard)
    private var numberOfPairsCard: Int {
        return flipButtonCollection.count / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.isHidden = true
        updateviewFromModel()
    }
    
    private func updateviewFromModel() {
        for index in flipButtonCollection.indices {
            let button = flipButtonCollection[index]
            let card = gameLogic.cards[index]
            if card.isFaceUp {
                UIView.transition(with: button, duration: 1, options: [.transitionFlipFromTop]) {
                    button.backgroundColor = .none
                }
                button.setTitle(gameLogic.emojiIdentifier(card: card), for: .normal)
                button.backgroundColor = .none
            } else if card.isMatched {
                UIView.animate(withDuration: 1) {
                    button.frame.origin = CGPoint(x: self.view.frame.width - 100, y: self.view.frame.height - 420)
                    button.setTitle(Const.setTitleCard, for: .normal)
                    button.backgroundColor = card.isFaceUp ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
                    button.layer.cornerRadius = 7
                    button.layer.borderWidth = 1
                    button.layer.borderColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
                }
            } else {
                button.setTitle(Const.setTitleCard, for : .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
                button.layer.cornerRadius = 10
                button.layer.shadowColor = UIColor.black.cgColor
                button.layer.shadowOpacity = 1
                button.layer.shadowOffset = .zero
                button.layer.shadowRadius = 10
            }
        }
    }
    
    private func resetCard() {
        for i in self.flipButtonCollection {
            i.bounds = self.view.bounds
            i.layer.borderWidth = 0
        }
    }
    
    @IBAction func restartButton(_ sender: UIButton) {
        restartButton.isHidden = true
        countLabel.text = String(touches)
        gameLogic = GameLogic(numberOfPairsCard: numberOfPairsCard)
        resultLabel.text = "Result = \(touches)"
        touches = 0
        resetCard()
        updateviewFromModel()
    }
    
    @IBAction private func tappedButton(_ sender: UIButton) {
        touches += 1
        lookTouch += 1
        if let buttonColletion = flipButtonCollection.firstIndex(of: sender) {
            gameLogic.choseCard(index: buttonColletion)
            restartButton.isHidden = false
            updateviewFromModel()
        }
    }
}
