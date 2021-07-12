//
//  MainVC+capture.swift
//  Instagrid
//
//  Created by Emilio Del Castillo on 12/07/2021.
//

import UIKit

extension MainViewController {
    
    /// Captures the canvas as an image
    func captureLayout () -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(canvas.frame.size, true, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        canvas.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
