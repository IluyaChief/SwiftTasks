import UIKit

class ViewController: UIViewController, ControlSetupProtocol {
    let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controlSetup()
        addGesture()
    }
    
    func addGesture() {
        let tapGestureLine = UITapGestureRecognizer(target: self, action: #selector(lineOfImage(_:)))
        let longPressGestureLine = UILongPressGestureRecognizer(target: self, action: #selector(removeAllPictures(_:)))
        tapGestureLine.numberOfTouchesRequired = Const.tapGestureInfo
        tapGestureLine.numberOfTapsRequired = Const.tapGestureInfo
        canvas.addGestureRecognizer(tapGestureLine)
        canvas.addGestureRecognizer(longPressGestureLine)
    }
    
    @objc func lineOfImage(_ sender: UITapGestureRecognizer) {
    }
    
    @objc func removeAllPictures(_ sender: UILongPressGestureRecognizer) {
        canvas.lines.removeAll()
        canvas.dot.removeAll()
    }
    
    func setupSubview() {
        view.addSubview(canvas)
    }
    
    func setupAutoLayout() {
        canvas.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            canvas.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            canvas.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            canvas.heightAnchor.constraint(equalTo: view.heightAnchor),
            canvas.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    func setupStyle() {
        canvas.isUserInteractionEnabled = true
        canvas.frame = view.frame
        canvas.backgroundColor = .white
    }
}

