import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonBar()
}
private func addButtonBar() {
    let tabBarVCFirst = TabBarFirstController()
    let tabBarVCSecond = TabBarSecondController()
    let content:[UIViewController] = [tabBarVCFirst, tabBarVCSecond]
    tabBarVCFirst.tabBarItem = UITabBarItem(title: Const.firstBar, image: .none, selectedImage: .none)
    tabBarVCSecond.tabBarItem = UITabBarItem(title: Const.secondBar, image: .none, selectedImage: .none)
        setViewControllers(content, animated: true)
    }
    
}
