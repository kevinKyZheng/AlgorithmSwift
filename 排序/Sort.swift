//
//  Sort.swift
//  Algorithm
//
//  Created by ios on 2019/3/29.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation


//MARK:归并排序
func mergeSort<T:Comparable>(_ arr:[T]) -> [T]{
    
    guard arr.count > 1 else {
        return arr
    }
    
    let mid = arr.count/2
    let leftArray = mergeSort(Array(arr[0..<mid]))
    let rightArray = mergeSort(Array(arr[mid ..< arr.count]))
    return merge(leftPile: leftArray, rightPile: rightArray)
}

func merge<T:Comparable>(leftPile:[T],rightPile:[T])->[T]{
    var leftIndex = 0
    var rigthIndex = 0
    var orderPile:[T] = []
    
    if orderPile.capacity < leftPile.count + rightPile.count {
        orderPile.reserveCapacity(leftPile.count + rightPile.count)
    }
    
    while true {
        guard leftIndex < leftPile.endIndex else{
            orderPile.append(contentsOf: rightPile[rigthIndex..<rightPile.endIndex])
            break
        }
        
        guard rigthIndex < rightPile.endIndex else{
            orderPile.append(contentsOf: leftPile[leftIndex ..< leftPile.endIndex])
            break
        }
        
        if leftPile[leftIndex] < rightPile[rigthIndex]{
            orderPile.append(leftPile[leftIndex])
            leftIndex += 1
        }else{
            orderPile.append(rightPile[rigthIndex])
            rigthIndex += 1
        }
    }
    
    return orderPile
}

//MARK:快排
func quickSort<T:Comparable>(_ arr:[T]) -> [T]{
    guard arr.count > 1 else{
        return arr
    }
    
    let pivot = arr[arr.count/2]
    let less = arr.filter {$0 < pivot}
    let equal = arr.filter {$0 == pivot}
    let greater = arr.filter{$0 > pivot}
    
    return quickSort(less) + equal + quickSort(greater)
}

//MARK:堆排序
public func kyheapsort<T>(_ a: [T], _ sort: @escaping (T, T) -> Bool) -> [T] {
    let reverseOrder = { i1, i2 in sort(i2, i1) }
    var h = Heap(array: a, sort: reverseOrder)
    return h.sort()
}


//MARK:冒泡排序
/**
 两种遍历方式:
 */

// TODO: 差别是什么

public func bobbleSort<T:Comparable>(_ arr:[T],_ sort:@escaping (T, T) -> Bool) -> [T]{
    var result = arr
    
    //从后往前遍历
//    for i in 0 ..< result.count{
//        for j in (i ..< result.count - 1).reversed() {
//            if sort(result[j],arr[j+1]){
//                result.swapAt(j, j+1)
//            }
//        }
//    }
    
    //从前往后遍历
    for i in 0 ..< result.count{
        for j in i+1 ..< result.count{
            if sort(result[j],result[j-1]){
                result.swapAt(j, j-1)
            }
        }
    }
    
    
    return result
}

//MARK:插入排序

public func insertSort<T:Comparable>(_ arr:[T],_ sort:@escaping (T,T) -> Bool) -> [T]{
    var result = arr
    for i in 1 ..< result.count{
        let key = result[i]
        var j = i
        while j > 0 && sort(key,result[j - 1]){
            result[j] = result[j - 1]
            j -= 1
        }
        result[j] = key
    }
    
    return result
}

func insertSort(_ array:[Int]) -> [Int]{
    var arr = array,key:Int,j:Int
    for i in 1 ..< arr.count {
        j = i
        key = arr[j]
        while j > 0 && arr[j-1] > key{
            arr[j] = arr[j-1]
            j -= 1
        }
        arr[j] = key
    }
    return arr
}

//MARK: 选择排序
