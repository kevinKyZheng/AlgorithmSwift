//
//  Queue.swift
//
//  基于数组实现的简单队列
//

import Foundation

struct Queue<T>{
    fileprivate var array = [T]()
    fileprivate var head = 0
    
    public var isEmpty:Bool{
        return array.isEmpty
    }
    
    public mutating func enqueue(_ element:T){
        array.append(element)
    }
    
    public mutating func dequeue() -> T?{
        if isEmpty{
            return nil
        }else{
            return array.removeFirst()
        }
    }
}

//MARK:高效的队列

//在出队的时候处理
struct QueueHigh1<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public mutating func dequeue() -> T?{
        //队空,返回nil
        guard head < array.count,let element = array[head] else {
            return nil
        }
        
        //每次出队,将头指针的位置置空,头指针+1
        array[head] = nil
        head += 1
        
    //当为nil的比例大于0.25,总数组长度>50,清空0到head之间的数据,head置0
        let percentage = Double(head) / Double(array.count)
        if array.count > 50 && percentage > 0.25{
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    
    
    public mutating func enqueue(_ element:T){
        array.append(element)
    }

}

//在入队的时候处理
struct QueueHigh2<T> {
    //TODO:数组是动态数组,有问题
    fileprivate var array = [T?]()
    fileprivate var head = 0
    fileprivate var tail = 0
    
    public mutating func dequeue() -> T?{
        //队空,返回nil
        if head == tail{
            return nil
        }else{
            let e = array[head]
            head += 1
            return e
        }
    }
    
    
    
    public mutating func enqueue(_ element:T){
        if tail == array.count - 1{//队满
            if head == 0 {
                fatalError("队列满了")
            }
            for i in head ..< tail{
                array[i-head] = array[i]
            }
            tail -= head
            head = 0
        }else{
            array[tail] = element
            tail += 1
        }
    }
    
}
