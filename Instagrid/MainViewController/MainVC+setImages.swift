//
//  MainVC+setImages.swift
//  Instagrid
//
//  Created by Emilio Del Castillo on 12/07/2021.
//

import UIKit

/// Available layouts of the app.
enum Layout: CaseIterable {
    case first
    case second
    case third
}

extension MainViewController {
    
    /// Sets up the UI according to the selected layout.
    /// - Parameter layout: The selected layout to display.
    func setupUI(for layout: Layout) {
        /// The total animation duration in seconds
        let ANIMATION_DURATION = 0.8
        
        UIView.animate(withDuration: ANIMATION_DURATION / 2) {
            self.topStackView.alpha = 0
            self.bottomStackView.alpha = 0
            
        } completion: { [self] _ in
            topStackView.removeSubviews()
            bottomStackView.removeSubviews()
            
            switch layout {
            case .first:
                topStackView.addArrangedSubview(createImage())
                bottomStackView.addArrangedSubview(createImage())
                bottomStackView.addArrangedSubview(createImage())
                
            case .second:
                topStackView.addArrangedSubview(createImage())
                topStackView.addArrangedSubview(createImage())
                bottomStackView.addArrangedSubview(createImage())
                
            case .third:
                topStackView.addArrangedSubview(createImage())
                topStackView.addArrangedSubview(createImage())
                bottomStackView.addArrangedSubview(createImage())
                bottomStackView.addArrangedSubview(createImage())
            }
            
            UIView.animate(withDuration: ANIMATION_DURATION / 2) {
                topStackView.alpha = 1
                bottomStackView.alpha = 1
            }
        }
        
    }
}


