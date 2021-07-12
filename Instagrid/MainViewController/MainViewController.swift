//
//  ViewController.swift
//  Instagrid
//
//  Created by Emilio Del Castillo on 28/06/2021.
//

import UIKit
import PhotosUI

class MainViewController: UIViewController {
    
    private var instagrid = Instagrid()
    var currentImageView: UIImageView?
    private var imagePicker = UIImagePickerController()

    private var pickerConfiguration = PHPickerConfiguration()
    lazy private var phPicker = PHPickerViewController(configuration: pickerConfiguration)

    @IBOutlet weak var canvas: UIView!
    @IBOutlet var layoutSelectionButtons: [UIButton]!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    override func viewDidLoad() {
        // The default layout is the second one
        setupUI(for: .second)
        pickerConfiguration.filter = .images
        imagePicker.delegate = self
        phPicker.delegate = self
    }
    
    /// Changes the selected layout.
    /// - Parameter sender: The tapped button.
    @IBAction private func selectLayout(_ sender: UIButton) {
        sender.isUserInteractionEnabled = false
        
        if let index = layoutSelectionButtons.firstIndex(of: sender) {
            
            for button in layoutSelectionButtons {
                button.isSelected = button == sender
                button.isUserInteractionEnabled = button != sender
            }
            
            let layout: Layout = Layout.allCases[index]
            
            setupUI(for: layout)
            
        }
    }
    
    /// Prepares the app to load an image in the tapped zone.
    @objc func loadImage(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        currentImageView = imageView
        pickImage()
    }
    
    /// Presents an alert to the user, asking to select a source in order to pick an image.
    private func pickImage() {
        let pickerAlert = UIAlertController(title: "Pick Image",
                                            message: "Choose Camera or Library",
                                            preferredStyle: .alert)
        
        // Check if the camera is available before adding the option
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            pickerAlert.addAction(camera)
        }
        
        let library = UIAlertAction(title: "Library", style: .default) { _ in
            self.present(self.phPicker, animated: true, completion: nil)
        }
        pickerAlert.addAction(library)
        
        self.present(pickerAlert, animated: true, completion: nil)
    }
}
