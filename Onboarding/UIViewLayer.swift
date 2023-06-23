//
//  UIViewLayer.swift
//  Onboarding
//
//  Created by Thành Mai on 23/06/2023.
//

import  UIKit

enum UIViewShadowType {
    case none
    case top
    case bottom
    case left
    case right
    case center
    
    func offset() -> CGSize {
        switch self {
        case .none: return CGSize(width: 0, height: 0)
        case .top: return CGSize(width: 2, height: 2)
        case .bottom: return CGSize(width: 1, height: 4)
        case .left: return CGSize(width: -2, height: 0)
        case .right: return CGSize(width: 0, height: 2)
        case .center: return CGSize(width: 2, height: 2)
        }
    }
}
enum BoderViewType: CGFloat {
    case none = 0
    case light = 1
    case regular = 2
    case medium = 3
    case large = 5
}

extension UIView {
    func shadowView(type: UIViewShadowType,
                    opacity: Float = 0.3,
                    color: UIColor = .black,
                    radius: CGFloat = 5) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = type.offset()
        self.layer.shadowOpacity = type == .none ? 0 : opacity
        self.layer.shadowRadius = radius
    }
    
    func borderRadius(radius: CGFloat = 16, color: CGColor? = nil, borderWidth: CGFloat = 0) {
        self.layer.cornerRadius = radius
        self.layer.borderColor = color
        self.layer.borderWidth = borderWidth
    }
    
    func borderView(borderType: BoderViewType = .light, borderColor: UIColor = UIColor.gray, radius: CGFloat = 0) {
        self.layer.cornerRadius = radius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderType.rawValue
    }
}
