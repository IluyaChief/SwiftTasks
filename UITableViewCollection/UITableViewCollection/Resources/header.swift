import UIKit

class HeaderView: UICollectionReusableView {
    static let reuseId = "Header"
     var headLabel: UILabel = {
        let label = UILabel()
        label.text = " Header"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    public func configure() {
        backgroundColor = .darkGray
        addSubview(headLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        headLabel.frame = bounds
    }
}

