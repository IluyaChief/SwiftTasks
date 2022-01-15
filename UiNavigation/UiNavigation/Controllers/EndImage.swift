import UIKit

class ImageController: UIViewController {
   private var imageView = UIImageView()
   private let endImage = UIImage(named: "2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paramImage()
    }
    private func paramImage() {
        imageView = UIImageView(frame: self.view.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.image = endImage
        imageView.center = view.center
        view.addSubview(imageView)
    }
}
