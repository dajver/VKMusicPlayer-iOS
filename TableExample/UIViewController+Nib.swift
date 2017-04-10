//
//  UIViewController+Nib.swift
//  MovieApp
//
//  Created by Pavel Borisov on 11/29/16.
//  Copyright © 2016 Pavel Borisov. All rights reserved.
//

import Foundation
import UIKit

enum Flow {
    case First, Second
}

private var flowAssociationKey: UInt8 = 0

extension UIViewController {
    
    var flow: Flow! {
        get {
            return objc_getAssociatedObject(self, &flowAssociationKey) as? Flow
        }
        set(newValue) {
            objc_setAssociatedObject(self, &flowAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    class func initWithNib<T : UIViewController>() -> T {
        
        return self.init(nibName: String(describing: self.classForCoder()), bundle: nil) as! T
    }
    
}
