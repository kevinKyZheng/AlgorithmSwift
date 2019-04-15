//
//  Dyanmic.swift
//  Algorithm
//
//  Created by ios on 2019/3/31.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

public func knapsack(weights:[Int],n:Int,w:Int){

    var states = Array(repeating: Array(repeating: false, count: w + 1), count: n)

    states[0][0] = true
    states[0][weights[0]] = true
    
    for i in 1 ..< n {
        for j in 0 ... w{
            if(states[i-1][j] == true){states[i][j] = states[i-1][j]}
        }
        for j in 0 ... (w - weights[i]){
            if states[i-1][j] == true {states[i][j + weights[i]] = true}
        }
    }
    
//    for item in states{print(item)}

    //打印最大重量
//    for i in (0 ... w).reversed(){
//        if states[n-1][i] == true {
//            print(i)
//            break
//        }
//    }
    //打印 装入的物品
    var index = w    
    for i in (1 ..< n).reversed(){
        if index - weights[i] > 0 && states[i-1][index - weights[i]] == true{
            print("\(weights[i]) ")
            index -= weights[i]
        }
    }
    
    if index != 0 {print(weights[0])}
    
}
public func knapsack1(weights:[Int],n:Int,w:Int){
    
    var states = Array(repeating: false, count: w+1)
    states[0] = true
    states[weights[0]] = true
    
    for i in 1 ..< n {
        for j in (0 ... (w - weights[i])).reversed(){
            if states[j] == true {states[j+weights[i]] = true}
        }
    }

    print(states)
    for i in (0 ... w).reversed(){
        if states[i] == true {
            print(i)
            break
        }
    }
}
// 带价值的背包问题 二维数组的解决办法
public func knapsack2(weights:[Int],values:[Int],n:Int,w:Int){
    
    var states = Array<[Int?]>(repeating: Array<Int?>(repeating: nil, count: w + 1), count: n)
    
    states[0][0] = 0
    states[0][weights[0]] = values[0]
    
    for i in 1 ..< n {
        for j in 0 ... w{ //第j的物品不装入时候的状态
            if(states[i-1][j] != nil){states[i][j] = states[i-1][j]}
        }
        for j in 0 ... (w - weights[i]){
            guard let state = states[i-1][j] else{ continue }
            let v = values[i] + state
            
            if states[i][j + weights[i]] == nil {
                states[i][j + weights[i]] = v
            }else{
                if v > states[i][j + weights[i]]!{
                    states[i][j + weights[i]] = v
                }
            }
        }
    }
    
    for item in states{print(item)}
    
    
    for i in (0 ... w).reversed(){
        if states[n-1][i] != nil {
            print(states[n-1][i])
            break
        }
    }
}
// 带价值的背包问题 一维数组的解决办法
public func knapsack3(weights:[Int],values:[Int],n:Int,w:Int){
    
    var states = Array<Int?>(repeating: nil, count: w + 1)
    
    states[0] = 0
    states[weights[0]] = values[0]
    
    for i in 1 ..< n {
        for j in (0 ... w - weights[i]).reversed(){
            guard let state = states[j] else {continue}
            let v = values[i] + state
            if states[j + weights[i]] == nil{
              states[j + weights[i]] = v
            }else{
                if v > states[j + weights[i]]!{
                    states[j + weights[i]] = v
                }
            }
        }
    }
    print(states)
}
