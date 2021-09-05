//
//  UIView.swift
//  Leavingstone-weather-app
//
//  Created by Giga Khizanishvili on 04.09.21.
//

import UIKit

extension UIView {
    
    public struct EdgeConstraint {
        public let top: NSLayoutConstraint
        public let bottom: NSLayoutConstraint
        public let leading: NSLayoutConstraint
        public let traling: NSLayoutConstraint
    }
    
    @discardableResult
    func pin(to parentView: UIView) -> EdgeConstraint {
        let top = topAnchor.constraint(equalTo: parentView.topAnchor)
        let bottom = bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        let left = leadingAnchor.constraint(equalTo: parentView.leadingAnchor)
        let right = trailingAnchor.constraint(equalTo: parentView.trailingAnchor)

        NSLayoutConstraint.activate([top, bottom, left, right])

        return EdgeConstraint(top: top, bottom: bottom, leading: left, traling: right)
    }
    
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func show() {
        isHidden = false
    }
    
    func hide() {
        isHidden = true
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}


