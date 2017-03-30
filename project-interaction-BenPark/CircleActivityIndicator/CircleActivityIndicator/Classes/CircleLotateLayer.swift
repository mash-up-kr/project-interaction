//
//  CircleLotateLayer.swift
//  Pods
//
//  Created by Naver on 2017. 3. 30..
//
//

import Foundation

internal class CircleLotateLayer: CALayer, CommonAnimation {
    
    var circle1 = CircleLayer()
    var circle2 = CircleLayer()
    var circle3 = CircleLayer()
    var circle4 = CircleLayer()
    
    override init() {
        super.init()
    }
    
    init(frame: CGRect) {
        super.init()
        self.frame = frame
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    private func prepare() {
        setLayer()
    }
    
    func setLayer() {
        circle1 = CircleLayer(frame: CLSet.leftUp.frame, color: CLSet.leftUp.color)
        circle2 = CircleLayer(frame: CLSet.rightUp.frame, color: CLSet.rightUp.color)
        circle3 = CircleLayer(frame: CLSet.rightDown.frame, color: CLSet.rightDown.color)
        circle4 = CircleLayer(frame: CLSet.leftDown.frame, color: CLSet.leftDown.color)
        
        [circle1, circle2, circle3, circle4].forEach { addSublayer($0) }
    }
    
    func animate() {
        CATransaction.begin()
        circle1.circle.add(colorAnimation(to: CLSet.leftUp.nextColor, easing: .linear), forKey: nil)
        circle2.circle.add(colorAnimation(to: CLSet.rightUp.nextColor, easing: .linear), forKey: nil)
        circle3.circle.add(colorAnimation(to: CLSet.rightDown.nextColor, easing: .linear), forKey: nil)
        circle4.circle.add(colorAnimation(to: CLSet.leftDown.nextColor, easing: .linear), forKey: nil)
        circle1.add(positionAnimation(to: CLSet.leftUp.nextPosition, easing: .linear), forKey: nil)
        circle2.add(positionAnimation(to: CLSet.rightUp.nextPosition, easing: .linear), forKey: nil)
        circle3.add(positionAnimation(to: CLSet.rightDown.nextPosition, easing: .linear), forKey: nil)
        circle4.add(positionAnimation(to: CLSet.leftDown.nextPosition, easing: .linear), forKey: nil)
        CATransaction.commit()
    }
}
