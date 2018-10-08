//
//  GradientView.swift
//  TinkoffFinance
//
//  Created by Denis Nefedov on 08/10/2018.
//  Copyright © 2018 X. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    // если цвет сменился, то обновляем лэйаут
    @IBInspectable var topColor: UIColor = UIColor.white {
        didSet {
            self.setNeedsLayout()
        }
    }

    @IBInspectable var bottomColor: UIColor = UIColor.white {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayout = CAGradientLayer()
        gradientLayout.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayout.startPoint = CGPoint(x:0,y:0)
        gradientLayout.endPoint = CGPoint(x:1,y:1)
        gradientLayout.frame = self.bounds
        self.layer.insertSublayer(gradientLayout, at: 0)
    }
}
