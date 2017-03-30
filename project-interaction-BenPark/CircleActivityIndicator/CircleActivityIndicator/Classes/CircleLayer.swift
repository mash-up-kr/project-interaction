//
//  CircleLayer.swift
//  Pods
//
//  Created by Naver on 2017. 3. 30..
//
//

import Foundation

internal class CircleLayer: CALayer {
    
    var circle = CALayer()
    var color = #colorLiteral(red: 0.2431372549, green: 0.3098039216, blue: 0.7058823529, alpha: 0.7955907534).cgColor
    
    override init() {
        super.init()
    }
    
    init(frame: CGRect ,color: CGColor) {
        super.init()
        self.frame = frame
        self.color = color
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
        circle.frame = bounds
        circle.cornerRadius = bounds.width / 2
        circle.masksToBounds = true
        circle.backgroundColor = color
        addSublayer(circle)
    }
}
