//
//  LinkedList.swift
//  Algorithm
//
//  Created by ios on 2019/4/2.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

public class LinkedList<T> where T:Hashable{
    //上次查找的index
    private var lastResultIndex:Int?
    
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
    
    public var count:Int{
        guard var node = head else {
            return 0
        }
        var a = 1
        while let next = node.next {
            a += 1
            node = next
        }
        return a
    }
    
    public func node(at index:Int) -> Node{
        assert(!isEmpty, "不能为空")
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
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        }else{
            let pre = node(at: index - 1)
            let next = pre.next
            
            newNode.previous = pre
            newNode.next = next
            
            pre.next = newNode
            newNode.previous = newNode
        }
    }
    
    @discardableResult public func remove(node:Node) -> Node?{
        let previous = node.previous
        let next = node.next
        
        //判断之前的节点是否存在,不存在则说明删除的是头节点
        if let pre = previous {
            pre.next = next
        }else{
            head?.next = next
        }
        
        next?.previous = previous
        node.next = nil
        node.previous = nil
        return node
    }
    
    //判断是否存在给定值的节点
    public func hasValue(value:T) -> Bool{
        //        链表为空
        guard let head = head else {
            return false
        }
        //        返回头结点
        if head.value == value{
            return true
        }else{
            var node = head.next
            while (node != nil) {
                if node?.value == value{return true}
                node = node?.next
            }
            return false
        }
    }
    
    public func searchNode(with value:T) -> LinkedListNode<T>?{
        guard let head = self.head else {
            return nil
        }
        
        if head.value == value{
            return head
        }else{
            var node = head.next
            while (node != nil) {
                if node?.value == value{return node}
                node = node?.next
            }
            return nil
        }
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

extension LinkedList{
    public func reverse() {
        var node = head
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }
}
