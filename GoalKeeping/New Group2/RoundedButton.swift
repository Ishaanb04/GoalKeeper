//
//  RoundedButton.swift
//  GoalKeeping
//
//  Created by Ishaan Bhasin on 7/26/18.
//  Copyright © 2018 Ishaan Bhasin. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {
    
   
    override func layoutSubviews() {
    super.layoutSubviews()
    
    updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
    didSet {
    updateCornerRadius()
    }
    }
    
    func updateCornerRadius() {
    layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }

    
    
    
}
