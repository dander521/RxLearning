//
//  CommonLan.swift
//  SoulTalk
//
//  Created by 倩倩 on 2019/7/16.
//  Copyright © 2019 Chen. All rights reserved.
//

import Foundation
import RxSwift

func commonLanguage() {
    
//    Observable.of("1", "2", "3", "4", "5", "6", "7", "8", "9")
    
    var numberFilter = Observable.from(["1", "2", "3", "4", "5", "6", "7", "8", "9"]).map { Int($0) }
        .filter {
            if let item = $0, item % 2 == 0  {
                print("even: \(item)")
                return true
            }
            return false
        }
    
    var bag = DisposeBag()
    Observable<Int>.interval(1, scheduler: MainScheduler.instance).subscribe(
        onNext: { print("Subscribed: \($0)") },
        onDisposed: { print("The queue was disposed. ") }
    ).disposed(by: bag)
    
    delay(5, closure: {
        bag = DisposeBag()
    })
    
    dispatchMain()
    
//    numberFilter.subscribe(
//        onNext: { event in print(event) },
//        onError: { print($0) },
//        onCompleted: { print("completed") },
//        onDisposed: {}
//
//    )
    
    
    
}
