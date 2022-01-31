import UIKit

class GameLogic  {
    var cards = [Card]()
    private var emojiCollection = Const.emoji
    private var emojiDictionary = [Card:String]()
    private var indexOfOneFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        } set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPairsCard: Int) {
        for _ in 1...numberOfPairsCard {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func emojiIdentifier(card: Card) -> String {
        if emojiDictionary[card] == nil {
            emojiDictionary[card] = emojiCollection.remove(at: emojiCollection.count.arc4RandomExtension)
        }
        return emojiDictionary[card] ?? Const.anotherResult
    }
    
    func choseCard(index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneFaceUpCard, matchingIndex != index {
                if cards [matchingIndex] == cards[index] {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneFaceUpCard = index
            }
        }
    }
}

    extension Int {
        var arc4RandomExtension : Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

