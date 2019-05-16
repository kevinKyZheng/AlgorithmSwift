//
//  LeetCode.swift
//  Algorithm
//
//  Created by ios on 2019/5/16.
//  Copyright © 2019 WT. All rights reserved.
//

import Foundation

/// 合并两个数
func mergeLinkList(node1:SingleLinkedNode<Int>?,node2:SingleLinkedNode<Int>?) -> SingleLinkedNode<Int>{
    let resultNode = SingleLinkedNode<Int>.init(value: 0)
    var nextNode = resultNode
    var l1 = node1,l2 = node2
    var result = 0
    
    while l1 != nil || l2 != nil || result != 0{
        
        if l1 != nil{
            result = l1!.value + result
            l1 = l1?.next
        }
        
        if l2 != nil{
            result = l2!.value + result
            l2 = l2?.next
        }
        
        nextNode.value = result % 10
        
        
        nextNode.next = SingleLinkedNode.init(value: result/10)
        nextNode = nextNode.next!
        
        result = result / 10
    }
    
    return resultNode
    
}

///旋转链表
func rotate(head:SingleLinkedNode<Int>?,_ k:Int) -> SingleLinkedNode<Int>{
    
    var node = head
    var length = 0
    
    //计算链表长度
    while node != nil {
        length += 1
        node = node?.next
    }
    
    //形成循环链表
    node = head
    while node != nil {
        if node?.next == nil{
            node?.next = head
            break
        }
        node = node?.next
    }
    
    
    let index = k % length
    node = head
    for i in 1 ... index{
        let temp = node?.next
        
        //将前一个作为尾节点
        if i == index{
            node?.next = nil
        }
        
        node = temp
    }
    
    return node!
}

///删除重复数据(无序链表)
/// 用哈希表储存每个值是否存在
/// 用两个指针,一个在前一个在后,不重复就一起移动,重复前一个指针不动
func removeRepeat(head:SingleLinkedNode<Int>?) -> SingleLinkedNode<Int>?{
    
    //空链表 或者 只有一个节点
    if head == nil || head?.next == nil {
        return head
    }
    
    var result = [Int:Bool]()
    var beforenNode = head
    var node = head?.next
    result[head!.value] = true
    
    while node != nil {
        if result[node!.value] == true{//重复
            beforenNode?.next = node?.next//删除重复节点
        }else{
            result[node!.value] = true
            beforenNode = beforenNode?.next
        }
        node = node?.next
    }
    
    return head
}


//func removeRepeatOrderd<T>(head:SingleLinkedNode<T>?) -> SingleLinkedNode<T>? where T:Equatable{
//
//    //空链表 或者 只有一个节点
//    if head == nil || head?.next == nil {
//        return head
//    }
//
//    var node = head
//
//    while node != nil {
//        if node?.value == node?.next?.value{
//            node?.next = node?.next?.next
//        }
//        node = node?.next
//    }
//
//    return head
//}

func removeRepeatOrderd(head:SingleLinkedNode<Int>?) -> SingleLinkedNode<Int>? {
    
    //空链表 或者 只有一个节点
    if head == nil || head?.next == nil {
        return head
    }
    
    var node = head
    var beforenNode = SingleLinkedNode(value: 0)
    beforenNode.next = head

    while node != nil {
        if node?.value != node?.next?.value{
            beforenNode.next = node?.next
            node = node?.next

        }else{
            node = node?.next
        }
    }
    
    return head
}
