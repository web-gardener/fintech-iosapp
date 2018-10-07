//
//  setPhotoButton.swift
//  TinkoffFinance
//
//  Created by Denis Nefedov on 01/10/2018.
//  Copyright © 2018 X. All rights reserved.
//

import UIKit

@IBDesignable
class setPhotoButton: UIButton {

    override open func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = CGFloat(25)
        clipsToBounds = true
    }
}

