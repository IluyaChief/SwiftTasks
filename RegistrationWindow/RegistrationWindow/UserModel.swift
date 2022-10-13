import UIKit

protocol UserModelProtocol {
    var name: String? { get set }
    var password: String? { get set }
}

enum SettingsKeys: String {
    case name
    case password
}

struct UserModel: UserModelProtocol {
    var name: String? {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.name.rawValue)
        } set {
            UserModel.set(text: SettingsKeys.name, value: newValue)
        }
    }
    var password: String? {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.password.rawValue)
        } set {
            UserModel.set(text: SettingsKeys.password, value: newValue)
        }
    }
    private static func set(text: SettingsKeys, value: String?) {
        let defaults = UserDefaults.standard
        let key = text.rawValue
        if let newValue = value {
            defaults.set(newValue , forKey: key)
        } else {
            defaults.removeObject(forKey: key)
        }
    }
}
