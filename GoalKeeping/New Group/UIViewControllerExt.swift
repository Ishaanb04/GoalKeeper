//
//  UIViewControllerExt.swift
//  GoalKeeping
//
//  Created by Ishaan Bhasin on 7/26/18.
//  Copyright © 2018 Ishaan Bhasin. All rights reserved.
//

import UIKit
extension UIViewController{
    
    func presentDetail(_ viewControllerToPresent : UIViewController){
        let transition = transitionCreation()
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    func presentSecondaryVC(_ viewControllerToPresent : UIViewController){
        let transition = transitionCreation()
        
        guard let presentVC = presentedViewController else {return }
        presentVC.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    func transitionCreation() -> CATransition{
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        return transition
    }
    
    func dismissDetails(){
        let transition = transitionCreation()
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    }
    
   

