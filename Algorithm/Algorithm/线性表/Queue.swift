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

//MARK:高效的队列,结局数据搬移问题

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
    
    fileprivate var array:[T?]
    fileprivate var head = 0
    fileprivate var tail = 0
    
    init(count:Int) {
        array = Array.init(repeating: nil, count: count)
    }
    
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
        if tail == array.count{//队满
            if head == 0 {
                print("队列满了")
                return
            }
            //把头到尾中间的数据 搬到0到头的位置
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

//基于链表
struct Queue3<T> where T:Hashable{
    fileprivate var list:LinkedList<T>
    
    public func enqueue(_ element:T){
        list.append(element)
    }
    
    public func dequeue(){
        if list.isEmpty{
            return
        }else{
            list.remove(node: list.head!)
        }
    }
}

/*****
循环队列
重点: 判断队满和队空
******/
struct CycleQueue<T> {
    fileprivate var array:[T?]
    fileprivate var maxCount:Int
    fileprivate var head = 0
    fileprivate var tail = 0
    
    init(count:Int) {
        array = Array.init(repeating: nil, count: count)
        maxCount = count
    }
    
    public mutating func enqueue(_ element:T){
        if (tail + 1) % maxCount == head { //队满
            print("full")
            return
        }else{
            array[tail % maxCount] = element
            tail += 1
        }
    }
    
    @discardableResult public mutating func dequeue() -> T?{
        if tail == head {
            print("empty")
            return nil
        }else{
            let result = array[head]
            head += 1
            return result
        }
    }
}
