//
//  Helper.swift
//  SoulTalk
//
//  Created by 倩倩 on 2019/7/16.
//  Copyright © 2019 Chen. All rights reserved.
//

import Foundation

public func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(
    deadline: .now() + delay) {
        closure()
    }
}

public func exampleDes(_ description: String,
                    action:()->Void) {
    print("======================\(description)======================")
    action()
}
