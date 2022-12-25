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
    
    func pinToEdges(view: UIView,
                    topConst: CGFloat,
                    rightConst: CGFloat,
                    heightConst: CGFloat,
                    widthConst: CGFloat) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.bottomAnchor, constant: topConst),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: rightConst),
            heightAnchor.constraint(equalToConstant: heightConst),
            widthAnchor.constraint(equalToConstant: widthConst)
])
    }
    
    func pin(height: CGFloat, width: CGFloat) {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: width)
        ])
    }
}


