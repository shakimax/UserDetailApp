//
//  Extensions+UITableViewCell.swift
//  ITSTest
//
//  Created by Максим on 18.01.22.
//

import UIKit

extension UITableViewCell {
    static var reuseId: String {
        String(describing: self)
    }
}
