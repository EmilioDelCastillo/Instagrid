//
//  ViewController.swift
//  Instagrid
//
//  Created by Emilio Del Castillo on 28/06/2021.
//

import UIKit

class MainViewController: UIViewController {

    private var instagrid = Instagrid()
    
    @IBOutlet var layoutSelectionButtons: [UIButton]!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    override func viewDidLoad() {
        setImages(for: .second)
    }
    
    @IBAction private func selectLayout(_ sender: UIButton) {
        sender.isUserInteractionEnabled = false
        
        if let index = layoutSelectionButtons.firstIndex(of: sender) {
            instagrid.selectLayout()
            
            for button in layoutSelectionButtons {
                button.isSelected = button == sender
                button.isUserInteractionEnabled = button != sender
            }
            
            let layout: Layout = Layout.allCases[index]
            
            setImages(for: layout)
            
        }
    }
    
    func setImages(for layout: Layout) {
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
    
    func createImage() -> UIImageView {
        let image = UIImage(named: "Plus")
        let imageView = UIImageView(image: image)
        
        imageView.backgroundColor = .white
        imageView.contentMode = .center
        imageView.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(loadImage(_:)))
        imageView.addGestureRecognizer(gesture)
        
        return imageView
    }
    
    @objc func loadImage(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        
    }
}

enum Layout: CaseIterable {
    case first
    case second
    case third
}
