//
//  ListReverse.swift
//  Algorithm
//
//  Created by 郑开元 on 2019/4/5.
//  Copyright © 2019 WT. All rights reserved.
//

//单链表
import Foundation

public class SingleLinkedNode<T> {
    var value:T
    var next:SingleLinkedNode<T>?
    
    init(value:T) {
        self.value = value
    }
}
class SingleLinkedList<T> {
    
    public typealias Node = SingleLinkedNode<T>
    
    private(set) var head:Node?
    
    public var isEmpty: Bool{
        return head == nil
    }
    
    public var last:Node?{
        guard var node = head else{
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    public func insert(node:Node,at index:Int){
        
    }
    
//    @discardableResult public func remove(node:Node) -> Node?{
//        guard let head = self.head else{return nil}
//
//        let next = node.next
//
////        if next == head.next{//说明删除的是头节点
////
////        }else{
////
////        }
//    }
    
}
extension SingleLinkedList{
    //单链表翻转
    public func reverse(){
        assert(!isEmpty)
        head = last
    }
}
