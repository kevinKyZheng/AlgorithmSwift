
/**
 链表的基本操作
 */

import Foundation

/**
 单链表翻转
 将最后一个节点remove到一个新链表
 
 时间O(n) 空间O(n)
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
 单链表翻转
递归
 */

public func reverse<T>(head:SingleLinkedNode<T>?) -> SingleLinkedNode<T>?{
    
    if head == nil || head?.next == nil{
        return head
    }else{
        let newhead = reverse(head: head?.next)
        head?.next?.next = head
        head?.next = nil
        return newhead
    }
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
 有序链表的合并
 
 想法: 两个指针,分别指一个链表,比较,并把小的放到新的列表
 */
public func mergeList2(first:LinkedList<Int>,second:LinkedList<Int>) -> LinkedList<Int>{
    let list = LinkedList<Int>()
    
    var firstNode = first.head
    var secondNode = second.head
    
    while firstNode != nil, secondNode != nil {
        if firstNode!.value < secondNode!.value{
            list.append(firstNode!.value)
            firstNode = firstNode!.next
        }else{
            list.append(secondNode!.value)
            secondNode = secondNode!.next
        }
    }
    
    //第一个链表 遍历完
    if firstNode == nil{
        list.append(secondNode!)
    }
    
    if secondNode == nil{
        list.append(firstNode!)
    }
    
    return list
}
/**
    链表中环的检测
 
 足迹法: 每遍历一次就跟hashmap中的值比较,如果没有,存入;如果有,证明有环
 */

//遍历
func detectLoop(list:LinkedList<Int>) -> Bool{
    var node = list.head
    var index = 0
    var map = Dictionary<LinkedListNode<Int>,Int>()
    
    while node != nil {
        if map[node!] != nil { //在hashmap中
            return true
        }else{
            map[node!] = index
            index += 1
        }
        node = node!.next
    }
    return false
}

// 递归
var map = Dictionary<LinkedListNode<Int>,Int>()
func detectLoop(node:LinkedListNode<Int>?,index:Int) -> Bool{
   
    //node=nil 代表是头结点 node.next=nil 代表是尾结点
    if node == nil || node?.next == nil{
        return false
    }
    if map[node!] != nil{
        return true
    }else{
        map[node!] = index
        return detectLoop(node: node?.next, index: index + 1)
    }
    
}
/**
 链表中环的检测
 
快慢指针的方法
 时间复杂度 O(n) 空间复杂度 O(1)
 */
func detectLoop1(list:LinkedList<Int>) -> Bool{
    var fast = list.head?.next?.next
    var slow = list.head?.next
    
    while slow != nil,fast != nil{
        if slow == fast {
            return true
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    return false
    
}
/**
 删除链表倒数第n个节点
 快慢指针,慢指针指向头,快指针指向index,一起移动,快指针到终点的时候,慢指针指向的就是要删除的节点
 
 时间复杂度 O(n) 空间复杂度 O(1)
 */
func removelastNode(list:LinkedList<Int> ,index:Int) -> LinkedListNode<Int>?{
    
    var indexNode = list.node(at: index)
    var slowNode = list.head
    
    while indexNode.next != nil {
        indexNode = indexNode.next!
        slowNode = slowNode?.next
    }

    return list.remove(node: slowNode!)
}

/**
  求链表的中间节点
 快慢指针,快指针动两个,慢指针动一个,快指针到尾结点,慢指针就是中点
 */
func getMiddleNode(_ list:LinkedList<Int>) -> LinkedListNode<Int>?{
    var slow = list.head
    var fast = list.head
    
    while let _ = fast?.next {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow
}
