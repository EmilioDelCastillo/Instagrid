//
//  MainVC+UIImagePicker.swift
//  Instagrid
//
//  Created by Emilio Del Castillo on 12/07/2021.
//

import UIKit

extension MainViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            currentImageView?.clipsToBounds = true
            currentImageView?.contentMode = .scaleAspectFill
            currentImageView?.image = selectedImage
        }
        dismiss(animated: true)
    }
}
