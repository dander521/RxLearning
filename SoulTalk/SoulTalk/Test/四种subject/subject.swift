//
//  subject.swift
//  SoulTalk
//
//  Created by 倩倩 on 2019/7/16.
//  Copyright © 2019 Chen. All rights reserved.
//

import Foundation
import RxSwift

func subject() {
    // 会员制 只能获取订阅后的消息
    let subject = PublishSubject<String>()
    
    let sub1 = subject.subscribe(
        onNext: {print("Sub1 - what happend: \($0)")}
    )
    subject.onNext("vip use")
    sub1.dispose()
    
    
    // 后续订阅可以获取到默认 如果之前有事件 获取上一次
    let subject1 = BehaviorSubject<String>(value: "free use")
    
    let sub2 = subject1.subscribe(
        onNext: {print("Sub2 - what happend: \($0)")}
    )
    subject1.onNext("free use")
    sub2.dispose()
    
    // 可以设置缓冲区 获取指定的历史记录
    let subject3 = ReplaySubject<String>.create(bufferSize: 2)
    let sub3 = subject1.subscribe(
        onNext: {print("Sub3 - what happend: \($0)")}
    )
    subject3.onNext("replay use")
    sub3.dispose()
    
    
    // 自定义 variable 执行相应的逻辑
    // 无 error 事件 不能手动发送 onComplete
    let stringVariable = Variable("variable")
    
    stringVariable.value = "change"
    print(stringVariable.value)
    
    let sub4 = stringVariable.asObservable().subscribe({ print("sub4: \($0)") })
    sub4.dispose()
    
}


