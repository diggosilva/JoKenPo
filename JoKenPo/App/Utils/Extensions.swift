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

func haptics() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
    let generator2 = UIImpactFeedbackGenerator(style: .medium)
    generator2.impactOccurred()
}
