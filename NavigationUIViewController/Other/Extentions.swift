//
//  Extentions.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 30.04.2022.
//

import UIKit

extension UIView {
    
    func trigger(count : Float = 5, for duration : TimeInterval = 0.3, withTranslation translation : Float = 5) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}
