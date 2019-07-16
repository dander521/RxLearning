
//
//  IgnoreOperator.swift
//  SoulTalk
//
//  Created by 倩倩 on 2019/7/16.
//  Copyright © 2019 Chen. All rights reserved.
//

import Foundation
import RxSwift

func ignoreAndGetElement() {
    exampleDes("ignoreElements") {
        
        let task = PublishSubject<String>()
        let bag = DisposeBag()
        
        task.ignoreElements().subscribe {
            print($0)
            }.disposed(by: bag)
        
        
        task.onNext("A")
        task.onNext("B")
        task.onNext("C")
        task.onCompleted()
        
        // 忽略操作符
        // ignoreElements 忽略y元素
        // skip 跳过
        // while 忽略当... 然后执行之后
        // skipUntil 忽略知道某个条件
        // distinctUntilChanged 忽略s和上次相同
        
        // 获取事件操作符
        // elementAt
        // filter 条件
        // take 2 获取条件之前连续的几个
        // takeWhile
        // takeWhileWithIndex
        // takeUntil
    }

}
