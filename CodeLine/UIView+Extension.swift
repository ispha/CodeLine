//
//  UIView+Extension.swift
//  Belo
//
//  Created by Muhammad Khan on 07/12/2020.
//  Copyright © 2020 belo. All rights reserved.
//

import UIKit

extension UIView {
    ///This method will use to get assigned constraint to some UIView without creating any IBOutlet for constraint
    ///All we need to pass constraint attribute , e.g if we need height cosntraint of any view we can call this method with attribute .height. it will return height constraint if any.
    func findConstraint(layoutAttribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        if layoutAttribute == .height || layoutAttribute == .width {
            return layoutAttribute == .height ? self.heightConstaint : self.widthConstaint
        } else if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: layoutAttribute) {
                return constraint
            }
        }
        if let superview = self.superview {
            return superview.findConstraint(layoutAttribute: .bottom)
        }
        return nil
    }
    
    ///Matching constraint attribte with respect to view.
    func itemMatch(constraint: NSLayoutConstraint, layoutAttribute: NSLayoutConstraint.Attribute) -> Bool {
        if let firstItem = constraint.firstItem as? UIView, let secondItem = constraint.secondItem as? UIView {
            let firstItemMatch = firstItem == self && constraint.firstAttribute == layoutAttribute
            let secondItemMatch = secondItem == self && constraint.secondAttribute == layoutAttribute
            return firstItemMatch || secondItemMatch
        }
        return false
    }
    
    var heightConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    var widthConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .width && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
}
