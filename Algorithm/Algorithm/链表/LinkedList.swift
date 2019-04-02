//
//  LinkedList.swift
//  Algorithm
//
//  Created by ios on 2019/4/2.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

public class LinkedList<T>{
    public typealias Node = LinkedListNode<T>
    
    public init() {}
    
    private(set) var head:Node?
    
    public var isEmpty:Bool{
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
    
    public func node(at index:Int) -> Node{
        assert(isEmpty, "不能为空")
        if index == 0 {
            return head!
        }else{
            var node = head?.next
            for _ in 1 ..< index{
                node = node?.next
                if node == nil{
                    break
                }
            }
            return node!
        }
    }
    
    public func append(_ value:T){
        let newNode = Node(value: value)
        append(newNode)
    }
    
    public func append(_ node:Node){
        let newNode = node
        
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        }else{
            head = node
        }
    }
    public func insert(_ value:T,at index:Int){
        let newNode = Node(value: value)
        insert(newNode, at: index)
    }
    public func insert(_ newNode:Node,at index:Int){
        if index == 0{
            newNode.next = head
            head?.previous = newNode
            head = newNode
        }else{
            let prev = node(at: index - 1)
            let next = prev.next
            
            newNode.next = next
            newNode.previous = prev
            prev.next = newNode
            next?.previous = newNode
            
        }
    }
    
    @discardableResult public func remove(node:Node) -> Node?{
        let pre = node.previous
        let next = node.next
        
        if let pre = pre{
            pre.next = next
        }else{
            head = next
        }
        
        next?.previous = pre
        node.previous = nil
        node.next = nil
        return node
    }
}

extension LinkedList:CustomStringConvertible{
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
