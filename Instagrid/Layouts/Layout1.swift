//
//  Layout1.swift
//  Instagrid
//
//  Created by Emilio Del Castillo on 06/07/2021.
//

import UIKit

class Layout1: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var topPicture: UIImageView!
    @IBOutlet weak var leftPicture: UIImageView!
    @IBOutlet weak var rightPicture: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("Layout1", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    
}

class Layout2: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var bottomPicture: UIImageView!
    @IBOutlet weak var leftPicture: UIImageView!
    @IBOutlet weak var rightPicture: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("Layout1", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    
}

class Layout3: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var topLeftPicture: UIImageView!
    @IBOutlet weak var topRightPicture: UIImageView!
    @IBOutlet weak var bottomLeftPicture: UIImageView!
    @IBOutlet weak var bottomRightPicture: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("Layout1", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    
}
