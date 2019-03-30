//
//  Heap.swift
//  Algorithm
//
//  Created by ios on 2019/3/30.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

public struct Heap<T> {
    
    var nodes = [T]()
    
    private var orderCriteria :(T,T)->Bool
    
    public init(sort:@escaping (T,T)->Bool) {
        self.orderCriteria = sort
    }
    
    public init(array:[T],sort:@escaping (T,T) -> Bool){
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    private mutating func configureHeap(from array:[T]){
        self.nodes = array
        //stride的用法,from起始,through终止(包含该值),步进的是-1,eg:from 5,through 1,by -1 结果是(5,4,3,2,1)
        for i in stride(from: (nodes.count/2 - 1), through: 0, by: -1){
            shiftDown(i)
        }
    }
    
    public var isEmpty:Bool{
        return nodes.isEmpty
    }
    
    public var count: Int{
        return nodes.count
    }
    
    //内联函数,不用多次调用函数栈,直接用return的内容替换,减少内存开销
    @inline(__always) internal func parentIndex(ofIndex i:Int) -> Int{
        return (i - 1) / 2
    }
    
    @inline(__always) internal func leftChildIndex(ofIndex i:Int) ->Int{
        return i*2 + 1
    }
    
    @inline(__always) internal func rightChildIndex(ofIndex i:Int) -> Int{
        return i*2 + 2
    }
    
    public func peek() -> T?{
        return nodes.first
    }
    
    public mutating func insert(_ value:T){
        nodes.append(value)
        self.shiftUp(nodes.count - 1)
    }
    
    public mutating func insert<S:Sequence>(_ sequence:S) where S.Iterator.Element == T{
        sequence.forEach { (value) in
            insert(value)
        }
    }
    
    @discardableResult public mutating func remove() -> T?{
        guard !self.nodes.isEmpty else {return nil}
        
        if self.nodes.count == 1 {
            return self.nodes.removeLast()
        }else{
            let peekNode = self.peek()
            nodes[0] = self.nodes.removeLast()
            shiftDown(0)
            return peekNode
        }
    }
    //MARK:堆化相关操作
    //从上往下堆化
    internal mutating func shiftDown(from index:Int,until endIndex:Int){
        let leftIndex = self.leftChildIndex(ofIndex: index)
        let rightIndex = self.rightChildIndex(ofIndex: index)
        
        var first = index
        if leftIndex < endIndex && orderCriteria(nodes[leftIndex],nodes[first]){
            first = leftIndex
        }
        
        if rightIndex < endIndex && orderCriteria(nodes[rightIndex],nodes[first]){
            first = rightIndex
        }
        
        if index == first {return}
        
        nodes.swapAt(first, index)
        shiftDown(from: first, until: endIndex)
    }
    internal mutating func shiftDown(_ index:Int){
        self.shiftDown(from: index, until: self.nodes.count)
    }
    //从下往上堆化
    internal mutating func shiftUp(_ index: Int){
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)

        while childIndex > 0 && orderCriteria(child,nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex] //子节点的值 变成 父节点的值
            childIndex = parentIndex //子节点index往上一层
            parentIndex = self.parentIndex(ofIndex: childIndex) //父节点的index也往上一层
        }

        nodes[childIndex] = child //最终的子节点index的位置,换成最早的那个子节点
    }

}

extension Heap {
    public mutating func sort() -> [T]{
        for i in stride(from: 1, to: nodes.count, by: 1).reversed() { 
            nodes.swapAt(0, i)
            shiftDown(from: 0, until: i)
        }
        
        return nodes
    }
}



