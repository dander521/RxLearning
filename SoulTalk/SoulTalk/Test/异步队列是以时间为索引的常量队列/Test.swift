//
//  Test.swift
//  SoulTalk
//
//  Created by 倩倩 on 2019/7/16.
//  Copyright © 2019 Chen. All rights reserved.
//

import Foundation

func asyncQueue() {
    
    let stringArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9"] // 常量 不可修改

    let fullFilter = stringArray.compactMap { Int($0) }.filter { $0 % 2 == 0 }
    print(fullFilter)
    
    let partialFilter = stringArray[4 ..< stringArray.count].compactMap { Int($0) }.filter { $0 % 2 == 0 }
    print(partialFilter)
}
