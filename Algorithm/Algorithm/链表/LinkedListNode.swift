//
//  LinkedListNode.swift
//  Algorithm
//
//  Created by ios on 2019/4/2.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

public class LinkedListNode<T> where T:Equatable{
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
