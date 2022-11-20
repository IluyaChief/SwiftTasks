//
//  Extensions.swift
//  RegistrationWindow
//
//  Created by MAC on 13.11.2022.
//

import UIKit

extension UIView {
    func addSubviewAndDisableAutoResizing(_ views: [UIView]) {
        views.forEach({ view in
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        })
    }
}

extension UITextField {
    func isValid(word: String) -> String? {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za=z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "Self Mathes %@",regularExpression)
        if !predicate.evaluate(with: word) {
         return "invalid"
        }
        return nil
    }
}
