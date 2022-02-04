//
//  Extensions+UIBarButtonItem.swift
//  ITSTest
//
//  Created by Максим on 19.01.22.
//

import UIKit

extension UIBarButtonItem {

    static func leftBarButton(_ target: Any?, action: Selector, imageName: String) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: imageName)
        button.setImage(image, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)

        let leftBarItem = UIBarButtonItem(customView: button)
        leftBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        leftBarItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        leftBarItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return leftBarItem
    }
}
