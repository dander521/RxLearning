//
//  CreateAndDebugOperator.swift
//  SoulTalk
//
//  Created by 倩倩 on 2019/7/16.
//  Copyright © 2019 Chen. All rights reserved.
//

import Foundation
import RxSwift

enum CustomError: Error {
    case somethingError
}

func debugAndOperator() {
    
    let customOb = Observable<Int>.create { observer in
        observer.onNext(10)
        observer.onNext(11)
        
        observer.onError(CustomError.somethingError)
        
        observer.onCompleted()
        
        return Disposables.create()
    }
    
    let disposeBag = DisposeBag()
    
    customOb.debug().subscribe(
    
        onNext: { print($0) },
        onError: { print($0) },
        onCompleted: {print("Completed")},
        onDisposed: { print("Game over") }
        ).disposed(by: disposeBag)
}
