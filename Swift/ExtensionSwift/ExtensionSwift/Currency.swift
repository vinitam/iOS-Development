//
//  Currency.swift
//  ExtensionSwift
//
//  Created by Vinita Miranda on 5/7/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

extension String {
    
    func addCurrency(amount :Float!) -> StringLiteralType
    {
        return "Rs. \(amount)"
    }
   
}
