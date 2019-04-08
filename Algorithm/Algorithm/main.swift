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

//var heap1 = Heap.init(array: [7,5,19,8,4,1,20,13,16], sort: {$0<$1})
////print(heap1.remove())
////heap1.insert(3)
////print(heap1.nodes)
//
////print(kyheapsort([7,5,19,8,4,1,20,13,16], {$0<$1}))
//
////knapsack(weights: [1,2,3,29,19,20,43], values: [20,34,123,34,1,33,56], n: 7, w: 8)
//
//knapsack(weights: [2,2,4,6,3], n:5 , w: 9)

//knapsack3(weights: [2,2,4,6,3], values:[3,4,8,9,6],n:5 , w: 9)
//MARK:链表

let list1 = LinkedList<Int>()
let list2 = LinkedList<Int>()
var list3 = SingleLinkedList<Int>()

list3.append(element: 1)
list3.append(element: 2)
list3.append(element: 3)
list3.append(element: 4)
//list3.append(element: 5)
//print(list3.removeLast()?.value)

print(reverse(list: list3))

list1.append(1)
//list2.append(2)
list1.append(8)
//list2.append(3)
list1.append(5)
list1.append(20)
//list2.append(7)
list1.append(30)

//list1.append(list1.head!)
//list2.append(50)

//print(detectCycle(list: list1))
//print(removelastNode(list: list1, index: 4))
print(list1)
print(getMiddleNode(list1))

//print(mergeList(first: list1,second: list2))

//print(list)
////print(list.node(at: 2).value)
//let node = list.last
//list.remove(node: node!)
//print(list)

//let l = LRU()
//l.list.append(1)
//l.list.append(2)
//l.list.append(3)
//l.list.append(4)
//print(l.list)
//l.addNewNode(value: 3)
//print(l.list)


//var q = CycleQueue<Int>.init(count:3)
//q.enqueue(1)
//q.enqueue(2)
//q.enqueue(3)
//q.enqueue(3)
//q.enqueue(3)
//q.enqueue(3)

//q.dequeue()
//q.dequeue()
//q.dequeue()
//print(q.dequeue())


//print(q)







