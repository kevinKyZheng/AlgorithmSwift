//
//  Search.swift
//  LinkedList
//
//  Created by ios on 2019/3/25.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation
//二分查找
func BinarySearch(arr:[Int],value:Int)->Int?{
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let mid = low + ((high - low)>>1)
        if value == arr[mid]{
            return mid
        }else if value > arr[mid]{
            low = mid + 1
        }else{
            high = mid - 1
        }
    }
    return nil
}

//查找第一个元素
func BinarySearchFirst(arr:[Int],value:Int)->Int?{
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let mid = low + ((high - low)>>1)
        if value > arr[mid]{
            low = mid + 1
        }else if value < arr[mid]{
            high = mid - 1
        }else{
            if mid == 0 || arr[mid - 1] != value{
                return mid
            }else{
                high = mid - 1
            }
        }
        
    }
    return nil
}

//查找第一个小于等于target的元素
func BinarySearchLess(arr:[Int],value:Int)->Int?{
    var low = 0
    var high = arr.count - 1
    
    while low <= high {
        let mid = low + ((high - low)>>1)
        
        if arr[mid]>value{
            high = mid - 1
        }else{
            if mid == arr.count - 1 || arr[mid + 1] > value{
                return mid
            }else{
                low = mid + 1
            }
        }
        
    }
    return nil
}
