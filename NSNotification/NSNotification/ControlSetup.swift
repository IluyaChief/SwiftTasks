import UIKit

protocol ControlSetupProtocol {
    func setupSubview()
    func setupAutoLayout()
    func setupStyle()
    func setupActions()
}

extension ControlSetupProtocol {
    func controlSetup() {
        setupSubview()
        setupAutoLayout()
        setupStyle()
        setupActions()
    }
}

struct MockData {
    static let textViewInfo = "Apps are often implemented as a set of use cases. Use cases are also known as acceptance criteria, or behaviors, and describe what an app is meant to do. Maybe a list needs to be sortable by date, type, or name. That's a use case. A use case is the layer of an application that is responsible for business logic. Use cases should be independent from the user interface implementation of them. They should also be small and well-defined. Deciding how to break down a complex app into smaller use cases is challenging and requires practice, but it's a helpful way to limit the scope of each problem you are solving and each class that you are writing.Building an app with VIPER involves implementing a set of components to fulfill each use case. Application logic is a major part of implementing a use case, but it's not the only part.The use case also affects the user interface. Additionally, it's important to consider how the use case fits together with other core components of an application, such as networking and data persistence. Components act like plugins to the use cases, and VIPER is a way of describing what the role of each of these components is and how they can interact with one another.One of the use cases or requirements for our to-do list app was to group the to-dos in different ways based on a user's selection. By separating the logic that organizes that data into a use case, we are able to keep the user interface code clean and easily wrap the use case in tests to make sure it continues to work the way we expect it to."
}

enum Const {
    static let keyboardHideTitle = "Hide"
    static let textViewSize: CGFloat = 400
    static let scrollViewSize: CGFloat = 800
    static let keyboardHideButtonWidth: CGFloat = 200
    static let keyboardHideButtonHeight: CGFloat = 20
    static let keyboardButtonTopAnchor: CGFloat = 40
    static let keyboardHideButtonCornerRadius: CGFloat = 20
    static let textViewFontSize: CGFloat = 25

}
