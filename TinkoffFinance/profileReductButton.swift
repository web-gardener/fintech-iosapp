//
//  profileReductButton.swift
//  TinkoffFinance
//
//  Created by Denis Nefedov on 01/10/2018.
//  Copyright © 2018 X. All rights reserved.
//

import UIKit

@IBDesignable
class profileReductButton: UIButton {
    override open func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        layer.borderWidth = CGFloat(1)
        layer.borderColor = self.titleLabel?.textColor.cgColor ?? UIColor.black.cgColor
        layer.cornerRadius = CGFloat(16)
        clipsToBounds = true
    }
}
