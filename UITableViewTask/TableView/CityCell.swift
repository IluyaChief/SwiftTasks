import UIKit

class CityCell: UITableViewCell {
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var labelName:UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    var expandCallback: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        cityImage.layer.cornerRadius = 10
        cityImage.layer.masksToBounds = true
    }
    
    func setup(city: City, visible:Bool = false) {
        labelName.text = city.name
        cityImage.image = UIImage(named: city.imagePath)
        infoLabel.text = city.description
        infoLabel.isHidden = !visible
    }
    
    @IBAction func tappedInfoButton() {
        expandCallback?()
    }
}
