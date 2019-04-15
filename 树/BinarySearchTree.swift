//
//  BinarySearchTree.swift
//  Algorithm
//
//  Created by ios on 2019/4/15.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

public class BianrySearchTree<T:Comparable> {
    
    public var tree:TreeNode<T>?
    
    init(root:TreeNode<T>) {
        tree = root
    }
    
    public func insert(element:T){
        var node = tree
        
        while node != nil{
            if element < node!.value{
                if node?.left == nil{
                    node?.left = TreeNode(element)
                    return
                }
                node = node!.left
            }else{
                if node?.right == nil{
                    node?.right = TreeNode(element)
                    return
                }
                node = node!.right
            }
        }
    }
    
    public func find(element:T) -> TreeNode<T>?{
        var node = tree
        
        while node != nil {
            if element < node!.value {
                node = node!.left
            }else if element > node!.value{
                node = node!.right
            }else{
                return node!
            }
        }
        
        return nil
    }
    
//    @discardableResult public func delete(element:T) -> TreeNode<T>?{
//        var node = tree
//        var result:TreeNode<T>?
//
//        while node != nil {
//            if element == node?.value{
//                result = node
//
//                if node?.left == nil || node?.right == nil{
//                    //只有一个节点
//                    if node?.left != nil{
//                        node = node?.left
//                    }else if node?.right != nil{
//                        node = node?.right
//                    }else{
//                        node = nil //叶节点
//                    }
//                }else{ //有两个节点
//                    var nodeP = node
//                    node = node?.right
//                    while node?.left != nil {
//                        node = node?.left
//                    }
//                    let temp = node
//                    nodeP = temp
//                    node = nil
//                }
//                return result
//
//            }else if element > node!.value{
//                node = node?.right
//            }else {
//                node = node?.left
//            }
//
//
//        }
//
//        return nil
//    }
}

