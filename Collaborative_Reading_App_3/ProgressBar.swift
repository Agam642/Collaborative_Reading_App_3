//
//  ProgressBar.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-05-17.
//  Copyright © 2017 Saif Al-Din Ali. All rights reserved.
//

import UIKit


class ProgressBar: UIView, CAAnimationDelegate {
    
    let fgProgressLayer = CAShapeLayer()
    let bgProgressLayer = CAShapeLayer()
    var animation = CABasicAnimation()
    var animationDidStart = false
    var timerDuration = 0
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadBgProgressBar()
        loadFgProgressBar()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadBgProgressBar()
        loadFgProgressBar()
    }
    
    
    func loadFgProgressBar() {
        
        let startAngle = CGFloat(-Double.pi / 2)
        let endAngle = CGFloat(3 * Double.pi / 2)
        let centerPoint = CGPoint(x: frame.width/2 , y: frame.height/2)
        let gradientMaskLayer = gradientMask()
        fgProgressLayer.path = UIBezierPath(arcCenter:centerPoint, radius: frame.width/2 - 30.0, startAngle:startAngle, endAngle:endAngle, clockwise: true).cgPath
        fgProgressLayer.backgroundColor = UIColor.clear.cgColor
        fgProgressLayer.fillColor = nil
        fgProgressLayer.strokeColor = UIColor.white.cgColor
        fgProgressLayer.lineWidth = 4.0
        fgProgressLayer.strokeStart = 0.0
        fgProgressLayer.strokeEnd = 0.0
        
        gradientMaskLayer.mask = fgProgressLayer
        layer.addSublayer(gradientMaskLayer)
    }
    
    
    
    func gradientMask() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.locations = [0.0, 1.0]
        let colorTop: AnyObject = CustomColor.lime.cgColor
        let colorBottom: AnyObject = CustomColor.summerSky.cgColor
        let arrayOfColors: [AnyObject] = [colorTop, colorBottom]
        gradientLayer.colors = arrayOfColors
        
        return gradientLayer
    }
    
    
    func loadBgProgressBar() {
        
        //Stes the position of the progress bar
        let startAngle = CGFloat(0.0)
        let endAngle = CGFloat(0.0)
        let centerPoint = CGPoint(x: frame.width/2 , y: frame.height/2)
        //Stes the properties of the progress bar
        let gradientMaskLayer = gradientMaskBg()
        bgProgressLayer.path = UIBezierPath(arcCenter:centerPoint, radius: frame.width/2 - 30.0, startAngle:startAngle, endAngle:endAngle, clockwise: true).cgPath
        bgProgressLayer.backgroundColor = UIColor.clear.cgColor
        bgProgressLayer.fillColor = nil
        bgProgressLayer.strokeColor = UIColor.white.cgColor
        bgProgressLayer.lineWidth = 4.0
        bgProgressLayer.strokeStart = 0.0
        bgProgressLayer.strokeEnd = 1.0
        
        gradientMaskLayer.mask = bgProgressLayer
        layer.addSublayer(gradientMaskLayer)
    }
    
    func gradientMaskBg() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.locations = [0.0, 1.0]
        //Adds the colours
        let colorTop: AnyObject = CustomColor.flipside.cgColor
        let colorBottom: AnyObject = CustomColor.flipside.cgColor
        let arrayOfColors: [AnyObject] = [colorTop, colorBottom]
        gradientLayer.colors = arrayOfColors
        
        return gradientLayer
    }
    
    //Sets the duration of the animation
    func setProgressBar(hours:Int, minutes:Int, seconds:Int) {
        let hoursToSeconds = hours * 3600
        let minutesToSeconds = minutes * 60
        let totalSeconds = seconds + minutesToSeconds + hoursToSeconds
        timerDuration = totalSeconds
    }
    
    func start() {
        if !animationDidStart {
            startAnimation()
        }else{
            resumeAnimation()
        }
    }
    
    func pause() {
        pauseAnimation()
    }
    
    func stop() {
        stopAnimation()
    }
    
    //Starts the animation
    func startAnimation() {
        
        resetAnimation()
        
        //Sets the properties of the animation
        fgProgressLayer.strokeEnd = 0.0
        animation.keyPath = "strokeEnd"
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(1.0)
        animation.duration = CFTimeInterval(timerDuration)
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = kCAFillModeForwards
        fgProgressLayer.add(animation, forKey: "strokeEnd")
        animationDidStart = true
        
    }
    
    //Resets the properites of the animation
    func resetAnimation() {
        fgProgressLayer.speed = 1.0
        fgProgressLayer.timeOffset = 0.0
        fgProgressLayer.beginTime = 0.0
        fgProgressLayer.strokeEnd = 0.0
        animationDidStart = false
    }
    
    //Stops the animation
    func stopAnimation() {
        fgProgressLayer.speed = 1.0
        fgProgressLayer.timeOffset = 0.0
        fgProgressLayer.beginTime = 0.0
        fgProgressLayer.strokeEnd = 0.0
        fgProgressLayer.removeAllAnimations()
        animationDidStart = false
    }
    
    //Pauses the animation
    func pauseAnimation(){
        let pausedTime = fgProgressLayer.convertTime(CACurrentMediaTime(), from: nil)
        fgProgressLayer.speed = 0.0
        fgProgressLayer.timeOffset = pausedTime
        
    }
    
    //Resumes the animation
    func resumeAnimation(){
        let pausedTime = fgProgressLayer.timeOffset
        fgProgressLayer.speed = 1.0
        fgProgressLayer.timeOffset = 0.0
        fgProgressLayer.beginTime = 0.0
        let timeSincePause = fgProgressLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        fgProgressLayer.beginTime = timeSincePause
    }
    
    internal func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        stopAnimation()
    }
    
    
}




