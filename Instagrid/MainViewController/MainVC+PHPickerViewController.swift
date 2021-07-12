//
//  MainVC+PHPickerViewController.swift
//  Instagrid
//
//  Created by Emilio Del Castillo on 12/07/2021.
//

import PhotosUI

extension MainViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        // We only have one image
        if let result = results.first {
            
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                    
                    DispatchQueue.main.async {
                        self.currentImageView?.clipsToBounds = true
                        self.currentImageView?.contentMode = .scaleAspectFill
                        self.currentImageView?.image = image as? UIImage
                    }
                }
            }
            
        }
        dismiss(animated: true)
    }
}
