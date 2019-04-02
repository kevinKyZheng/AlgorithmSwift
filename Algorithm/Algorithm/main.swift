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

//print(kyheapsort([7,5,19,8,4,1,20,13,16], {$0<$1}))

//knapsack(weights: [1,2,3,29,19,20,43], values: [20,34,123,34,1,33,56], n: 7, w: 8)

knapsack(weights: [2,2,4,6,3], n:5 , w: 9)

//knapsack3(weights: [2,2,4,6,3], values:[3,4,8,9,6],n:5 , w: 9)

let list = LinkedList<String>()
print(list.isEmpty)
list.append("1")
list.append("2")
list.append("3")
list.append("4")
//print(list)
print(list.node(at: 2).value)


