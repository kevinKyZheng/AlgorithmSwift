//
//  main.swift
//  Algorithm
//
//  Created by ios on 2019/3/29.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

//print(cal8Queens(row: 0))

//bag(0, 0, [1,2,3,5], 10, 4)
//
//print(maxW)

var heap1 = Heap.init(array: [7,5,19,8,4,1,20,13,16], sort: {$0<$1})
//print(heap1.remove())
//heap1.insert(3)
//print(heap1.nodes)

print(kyheapsort([7,5,19,8,4,1,20,13,16], {$0<$1}))
