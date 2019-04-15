//
//  Tree.swift
//  Algorithm
//
//  Created by ios on 2019/4/15.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

public class TreeNode<T>{
    var value:T
    var left:TreeNode?
    var right:TreeNode?
    
    init(_ value:T,left:TreeNode?,right:TreeNode?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    convenience init(_ value:T,left:TreeNode){
        self.init(value, left: left, right: nil)
    }
    
    convenience init(_ value:T,right:TreeNode){
        self.init(value, left: nil, right: right)
    }
    
    convenience init(_ value:T){
        self.init(value, left: nil, right: nil)
    }
}


extension TreeNode{
    ///中序遍历
    func traverseInOrder(process:(T)->Void){
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    ///前序遍历
    func traversePreOrder(process:(T)->Void){
        process(value)
        left?.traverseInOrder(process: process)
        right?.traverseInOrder(process: process)
    }
    ///后序遍历
    func traversePostOrder(process:(T)->Void){
        left?.traverseInOrder(process: process)
        right?.traverseInOrder(process: process)
        process(value)
    }
    
    ///非递归,用栈实现
    
    
}

extension TreeNode:CustomStringConvertible{
    
    public var description: String {
        var s = "\(value)->"
        
        s += "[left:\(String(describing: left ?? nil)),right:\(String(describing: right ?? nil))]"
        return s
    }
    
}

///深度
func depth<T>(root:TreeNode<T>?) -> Int{
    guard let root = root else {
        return 0
    }
    return max(depth(root: root.left), depth(root: root.right)) + 1
}

/// 判断一颗二叉树是否为二叉查找树
func isValidBST<T:Comparable>(root: TreeNode<T>?) -> Bool {
    return _helper(root, nil, nil)
}

private func _helper<T:Comparable>(_ node: TreeNode<T>?, _ min: T?, _ max: T?) -> Bool {
    guard let node = node else {
        return true
    }
    // 所有右子节点都必须大于根节点
    if let min = min, node.value <= min {
        return false
    }
    // 所有左子节点都必须小于根节点
    if let max = max, node.value >= max {
        return false
    }
    
    return _helper(node.left, min, node.value) && _helper(node.right, node.value, max)
}


/// 用栈实现的前序遍历
func preorderTraversal<T>(root: TreeNode<T>?) -> [T] {
    var res = [T]()
    var stack = [TreeNode<T>]()
    var node = root
    
    while !stack.isEmpty || node != nil {
        if node != nil {
            res.append(node!.value)
            stack.append(node!)
            node = node!.left
        } else {
            node = stack.removeLast().right
        }
    }
    
    return res
}

//func inOrderTraversal<T>(root: TreeNode<T>?) -> [T]{
//    var res = [T]()
//    var stack = [TreeNode<T>]()
//    var node = root
//
//    while  !stack.isEmpty || node != nil {
//        if node != nil{
//            stack.append(node!)
//            node = node!.left
//        }else{
//            res.append(stack.removeLast().value)
//            node = stack.removeLast().right
//        }
//    }
//
//    return res
//}
