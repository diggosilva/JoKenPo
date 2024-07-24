//
//  Extensions.swift
//  JoKenPo
//
//  Created by Diggo Silva on 24/07/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({ addSubview($0) })
    }
}
