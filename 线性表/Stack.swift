//
//  Stack.swift
//  Algorithm
//
//  Created by 郑开元 on 2019/4/7.
//  Copyright © 2019 WT. All rights reserved.
//

//栈
import Foundation

struct Stack<T> {
    fileprivate var array:[T] = [T]()
    
    public mutating func push(_ element:T){
        array.append(element)
    }
    
    public mutating func pop() -> T?{
        return array.popLast()
    }
    
    public var isEmpty:Bool{
        return array.isEmpty
    }
}
