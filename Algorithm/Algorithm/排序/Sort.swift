//
//  Sort.swift
//  Algorithm
//
//  Created by ios on 2019/3/29.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation


//归并排序
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
