//
//  CollectionViewCell.swift
//  UITableViewCollection
//
//  Created by MAC on 15.02.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heroImageVIew: UIImageView!
    var path: String?
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(hero: Hero) {
        heroImageVIew.image = UIImage(named: hero.imagePath)
    }
    
    func configure(image : Hero) {
        guard let url = URL(string: image.urlString) else { return }
        let getDataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.heroImageVIew.image = image
            }
        }
        getDataTask.resume()
    }
}
