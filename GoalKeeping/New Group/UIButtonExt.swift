//
//  UIButtonExt.swift
//  GoalKeeping
//
//  Created by Ishaan Bhasin on 7/26/18.
//  Copyright © 2018 Ishaan Bhasin. All rights reserved.
//

import UIKit

extension UIButton{
    
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.6235294118, blue: 0.7960784314, alpha: 1)
    }
    
    func setDeselectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.3870790601, green: 0.677613318, blue: 0.8707318902, alpha: 0.709760274)
    }
}
