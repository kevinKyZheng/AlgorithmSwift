
/**
 链表的基本操作
 */

import Foundation

/**
 单链表翻转
 */

public func reverse(list:SingleLinkedList<Int>) -> SingleLinkedList<Int>{
    
    assert(!list.isEmpty, "not empty")
    
    var result = SingleLinkedList<Int>()
    var temp = list
    
    while let last = temp.removeLast() {
        result.append(node: last)
    }

    return result
    
    
    
}

/**
 有序链表的合并
 
 想法: 遍历第一个链表,拿第二个链表中的节点比较,如果合适,继续拿第二个链表的下一个节点.如果第二个链表遍历完,退出,处理第一个链表的最后一个节点
 */
public func mergeList(first:LinkedList<Int>,second:LinkedList<Int>) -> LinkedList<Int>{
    var flag = false
    assert(!first.isEmpty)
    assert(!second.isEmpty)
    
    let result = first
    
    var currentNode = second.head!
    var resultNode = result.head!
    
    //遍历第一个链表
    while let resultNext = resultNode.next {//最后一个节点处理不了
        if resultNode.value < currentNode.value && resultNext.value > currentNode.value {
            
            //插入操作,第一个链表节点指向 currentNode
            resultNode.next = currentNode
            currentNode.previous = resultNode
            
            var currentNext = currentNode.next
            
            //currentNode后续值还比resultNext小
            while currentNext!.value < resultNext.value{
                //第二个链表遍历完毕
                if currentNext?.next == nil{
                    flag = true
                    break
                }else{
                    currentNext = currentNext?.next
                }
            }
            
            currentNode = currentNext!

            //插入操作
            currentNode.next = resultNext
            resultNext.previous = currentNode
 
        }
        //移动第一个链表
        resultNode = resultNext
    }
    //第二个链表还有数据
    if flag == false {
        //处理第一个链表的最后一个节点
        resultNode.next = currentNode
        currentNode.previous = resultNode
    }
    return result
}


/**
    链表中环的检测var
 */

func detectCycle(list:LinkedList<Int>) -> Bool{
    guard var node = list.head else{return false}
    node.value = Int(INTMAX_MAX)
    while let next = node.next {
        if next.value == Int(INTMAX_MAX){
            return true
        }
        node = next
    }
    return false
}

/**
 删除链表倒数第n个节点
 */
func removelastNode(list:LinkedList<Int> ,index:Int) -> LinkedListNode<Int>?{
    guard var last = list.last else{return nil}
    
    for _ in 0 ..< index - 1 {
        if last.previous == nil{
            return nil
        }else{
            last = last.previous!
        }
    }
    
    return list.remove(node: last)
}

/**
  求链表的中间节点
 */
func getMiddleNode(_ list:LinkedList<Int>) -> LinkedListNode<Int>{
    let count = list.count
    
    let middle = count / 2
    
    return list.node(at: middle)
}
