//
//  LinkedListNode.swift
//  Algorithm
//
//  Created by ios on 2019/4/2.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

public class LinkedListNode<T> where T:Hashable{
    var value:T
    var next:LinkedListNode<T>?
    var previous:LinkedListNode<T>?
    
    public init(value:T){
        self.value = value
    }
}

extension LinkedListNode:CustomStringConvertible{
    
    public var description: String {
        return "\(self.value)"
    }
    
}

extension LinkedListNode:Hashable{
    public static func == (lhs: LinkedListNode<T>, rhs: LinkedListNode<T>) -> Bool {
        return lhs.value == rhs.value
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

