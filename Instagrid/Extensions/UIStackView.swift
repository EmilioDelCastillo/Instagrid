//
//  UIStackView.swift
//  Instagrid
//
//  Created by Emilio Del Castillo on 09/07/2021.
//

import UIKit

extension UIStackView {
    /// Removes all the subviews.
    func removeSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
}
