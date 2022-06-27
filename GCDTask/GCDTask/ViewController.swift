//  Created by MAC on 26.06.2022.
//

import UIKit

class ViewController: UIViewController {
    var riader = RiaderWriter <Int> (data: [1])
    let queue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    override func viewDidLoad() {
        super.viewDidLoad()
        insert()
    }
    
    func insert() {
        for i in 1...100 {
            queue.async {
                if i % 10 == 0 { self.riader.insert(i + 100)}
            }
            queue.async {
                self.riader.getData()
            }
        }
    }
}


class RiaderWriter <T> {
    private var data:[T]
    private let queue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    func getData() -> [T] {
        queue.async {
            print("read info \(String(describing: self.data.last))")
        }
        return data
    }
    
    func insert(_ value: T) {
        queue.async(flags: .barrier) { [unowned self] in
            print("Insert \(value)")
            self.data.append(value)
            print("Insert \(value) completed")
        }
    }
    init(data: [T]) {
        self.data = data
    }
}
