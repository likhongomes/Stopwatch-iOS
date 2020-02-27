//
//  StopWatch.swift
//  StopWatch
//
//  Created by Likhon Gomes on 2/26/20.
//  Copyright © 2020 Likhon Gomes. All rights reserved.
//

import Foundation

class StopWatch{
    
    private var time:NSDate?
    private var startTime = Date()
    private var isActive = false
    private var currentTime = Date()
    
    func start(){
        if(isActive == false){
            startTime = Date()
            isActive = true
        }
    }
    
    func getTime() -> String {
        currentTime = Date()
        
        let x = currentTime.timeIntervalSince(self.startTime)
        print(x)
                
        let difference = Calendar.current.dateComponents([.hour, .minute, .second, .nanosecond], from: startTime, to: currentTime)
        let formattedString = String(format: "%02d:%02ld:", difference.minute!, difference.second!)
        let nanosecond = String("\(difference.nanosecond!.digits[0])")
        return formattedString+nanosecond
    }
    
    
    func stop(){
        startTime = Date()
    }
    
}

extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}
