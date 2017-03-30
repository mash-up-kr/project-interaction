//
//  CircleActivityIndicator.swift
//  Pods
//
//  Created by Naver on 2017. 3. 30..
//
//

import Foundation

public class CircleActivityIndicator: UIView {
    
    private var circleLotateLayer = CircleLotateLayer()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func prepare() {
        setLayer()
    }
    
    func setLayer() {
        circleLotateLayer = CircleLotateLayer(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        layer.addSublayer(circleLotateLayer)
    }
    
    public func animate() {
        circleLotateLayer.animate()
    }
}
