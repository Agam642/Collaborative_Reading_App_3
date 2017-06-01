//
//  CountdownTimer.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-05-17.
//  Copyright © 2017 Saif Al-Din Ali. All rights reserved.
//

import UIKit

//use popover

protocol CountdownTimerDelegate {
    func countdownTimerDone()
    func countdownTime(time: (hours: String, minutes:String, seconds:String))
}

class CountdownTimer {
    
    var delegate: CountdownTimerDelegate?
    
    var timer = Timer()
    var seconds = 0.0
    var duration = 0.0
    
    
    func setTimer(hours:Int, minutes:Int, seconds:Int) {
        
        let hoursToSeconds = hours * 3600
        let minutesToSeconds = minutes * 60
        let secondsToSeconds = seconds
        
        let seconds = secondsToSeconds + minutesToSeconds + hoursToSeconds
        self.seconds = Double(seconds)
        self.duration = Double(seconds)
        
        delegate?.countdownTime(time: timeString(time: TimeInterval(ceil(duration))))
    }
    
    func start() {
        runTimer()
    }
    
    func pause() {
        timer.invalidate()
    }
    
    func stop() {
        timer.invalidate()
        duration = seconds
        delegate?.countdownTime(time: timeString(time: TimeInterval(ceil(duration))))
    }
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc   func updateTimer(){
        if duration < 0.0 {
            timer.invalidate()
            timerDone()
            delegate?.countdownTimerDone()
        } else {
            duration -= 0.01
            delegate?.countdownTime(time: timeString(time: TimeInterval(ceil(duration))))
        }
    }
    
    func timeString(time:TimeInterval) -> (hours: String, minutes:String, seconds:String) {
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return (hours: String(format:"%02i", hours), minutes: String(format:"%02i", minutes), seconds: String(format:"%02i", seconds))
        
    }
    
    func timerDone() {
        timer.invalidate()
        duration = seconds
        delegate?.countdownTimerDone()
    }
    
}
