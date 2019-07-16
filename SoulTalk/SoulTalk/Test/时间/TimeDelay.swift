//
//  TimeDelay.swift
//  SoulTalk
//
//  Created by 倩倩 on 2019/7/16.
//  Copyright © 2019 Chen. All rights reserved.
//

import Foundation
import RxSwift

func timeScheduler() {
    let interval = Observable<Int>.interval(1, scheduler: MainScheduler.instance).publish()
    
    _ = interval.subscribe({
        print("\($0)")
    })
    
    _ = interval.connect()
    
    delay(2) {
        _ = interval.subscribe({
            print("ss \($0)")
        })
    }
    
    dispatchMain()
    
    // multicast
    
    // replay replayAll
    
    // buffer
    
    // window
    
}
