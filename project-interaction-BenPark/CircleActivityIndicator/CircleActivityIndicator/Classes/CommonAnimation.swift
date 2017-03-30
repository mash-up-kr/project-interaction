//
//  CommonAnimation.swift
//  Pods
//
//  Created by Naver on 2017. 3. 30..
//
//

import Foundation

enum KeyframeAnimationType: String {
    
    case color = "backgroundColor"
    case position = "position"
    case rotate = "transform.rotation"
    case scale = "transform.scale"
    case opacity = "opacity"
}

enum EasingType: String {
    
    case linear
    case easeIn
    case easeOut
    case easeInOut
    case defaultEasing
    
    var rawValue: String {
        switch self {
        case .linear: return kCAMediaTimingFunctionLinear
        case .easeIn: return kCAMediaTimingFunctionEaseIn
        case .easeOut: return kCAMediaTimingFunctionEaseOut
        case .easeInOut: return kCAMediaTimingFunctionEaseInEaseOut
        case .defaultEasing: return kCAMediaTimingFunctionDefault
        }
    }
}

internal protocol CommonAnimation { }

internal extension CommonAnimation {
    
    func colorAnimation(to: CGColor, easing: EasingType) -> CABasicAnimation {
        return animation(to: to, keyPath: .color, easing: easing)
    }
    
    func positionAnimation(to: CGPoint, easing: EasingType) -> CABasicAnimation {
        return animation(to: to, keyPath: .position, easing: easing)
    }
    
    func rotateAnimation(to: CGFloat, easing: EasingType) -> CABasicAnimation {
        return animation(to: to, keyPath: .rotate, easing: easing)
    }
    
    func scaleAnimation(to: CGFloat, easing: EasingType) -> CABasicAnimation {
        return animation(to: to, keyPath: .scale, easing: easing)
    }
    
    func opacityAnimation(to: CGFloat, easing: EasingType) -> CABasicAnimation {
        return animation(to: to, keyPath: .opacity, easing: easing)
    }
    
    private func animation(to: Any, keyPath: KeyframeAnimationType, easing: EasingType) -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = keyPath.rawValue
        animation.toValue = to
        animation.duration = 0.6
        
        animation.repeatCount = Float.infinity
        animation.timingFunction = CAMediaTimingFunction(name: easing.rawValue)
        return animation
    }
}
