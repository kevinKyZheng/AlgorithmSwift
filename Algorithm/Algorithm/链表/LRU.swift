//
//  LRU.swift
//  Algorithm
//
//  Created by 郑开元 on 2019/4/5.
//  Copyright © 2019 WT. All rights reserved.
//

import Foundation

class LRU {
    var list:LinkedList<Int>
    
    init() {
       list = LinkedList()
    }
    
    public func addNewNode(value:Int){
        //不存在，直接加到头部
        if !list.hasValue(value: value){
            list.insert(value, at: 0)
        }else{//存在，删除对应节点，加到头部
            let node = self.list.searchNode(with: value)
            list.remove(node: node!)
            list.insert(node!, at: 0)
        }
    }

    
}
