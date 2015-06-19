//
//  GradientView.swift
//  GradientDemo
//
//  Created by Vinita Miranda on 6/19/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import Foundation
import UIKit
extension UIView
{
    func applyGradient()
    {
        var gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.whiteColor().CGColor, UIColor.blackColor().CGColor]
        self.layer.insertSublayer(gradient, atIndex: 0)
    }
}