//
//  Transform.swift
//  SoulTalk
//
//  Created by 倩倩 on 2019/7/16.
//  Copyright © 2019 Chen. All rights reserved.
//

import Foundation
import RxSwift

func transform() {
    
    if true {
        let bag = DisposeBag()
        
        // toArray
        Observable.of(1, 2, 3)
            .toArray()
            .subscribe({
                dump($0)
                dump(type(of: $0))
            }).disposed(by: bag)
        
        // scan
        let numbers = PublishSubject<Int>()
        
        numbers.asObserver()
        .scan(0, accumulator: +)
            .subscribe(onNext: { (sum: Int) in
                dump(sum)
            }).disposed(by: bag)
        
        // map
        Observable.of(1, 2, 3)
            .map { value in value * 2 }
            .subscribe({
                dump($0)
                dump(type(of: $0))
            }).disposed(by: bag)
        
        // flatmap
        let john = Player(score: Variable(70))
        let jole = Player(score: Variable(90))
        
        let players = PublishSubject<Player>()
        
        _ = players.asObservable()
            .flatMap({
                $0.score.asObservable()
            })
            .subscribe({
                dump($0)
            })
        
        players.onNext(john)
        players.onNext(jole)
        
        
        // flatMap 多个 observable
        // flatMapLatest 切换到新的 observable
    }
}
