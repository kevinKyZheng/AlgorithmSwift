//
//  SignleLinkedList.swift
//  Algorithm
//
//  Created by ios on 2019/4/8.
//  Copyright © 2019年 WT. All rights reserved.
//

/**
    单链表
 */
import Foundation

public class SingleLinkedNode<T> {
    var value:T
    var next:SingleLinkedNode<T>?
    
    init(value:T) {
        self.value = value
    }
}
public struct SingleLinkedList<T> {
    
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
    
    public mutating func append(node:Node){
        if head == nil{
            head = node
        }else{
            last?.next = node
        }
    }
    
    public mutating func append(element:T){
        let node = Node.init(value: element)
        append(node: node)
    }
    
    public mutating func removeLast() -> Node?{
        guard var node = head else {
            return nil
        }
        
        while node.next?.next != nil  {
            node = node.next!
        }
        
        var result = node.next

        if result == nil {
            result = head
            head = nil
        }else{
            node.next = nil
        }
        
        return result

    }
    
}
extension SingleLinkedList:CustomStringConvertible{
    public var description: String {
        var s = "["
        var node = head
        while let currentNode = node {
            s += "\(currentNode.value)"
            node = currentNode.next
            if node != nil {s += ", "}
        }
        return s + "]"
    }
}
