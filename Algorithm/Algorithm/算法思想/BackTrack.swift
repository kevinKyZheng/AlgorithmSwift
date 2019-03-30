//
//  BackTrack.swift
//  Algorithm
//
//  Created by ios on 2019/3/30.
//  Copyright © 2019年 WT. All rights reserved.
//

//回溯算法
import Foundation

//MARK:八皇后问题

var result = Array<Int>()

public func cal8Queens(row:Int){
    result.reserveCapacity(8)

    if row == 8 { //放满了
        printQueens(result: result)
        return
    }
    
    for column in 0 ..< 8 {
        if isOk(row: row, column: column){ //满足条件
            result.insert(column, at: row)
            cal8Queens(row: row + 1)
        }
    }
}

private func isOk(row:Int,column:Int)->Bool{
    var leftup = column - 1,rightup = column + 1 //左上角,右上角
    var i = row - 1 //上一行
    while i >= 0 {
        if result[i] == column { return false }//正上方有棋子
        
        if leftup > 0 { //左上方
            if result[i] == leftup {return false}
        }
        
        if rightup < 8{ //右上方
            if result[i] == rightup {return false}
        }
        leftup -= 1
        rightup += 1
        i -= 1
    }
    return true
}

private func printQueens(result:[Int]){
    for row in 0 ..< 8 {
        for column in 0 ..< 8 {
            if result[row] == column{
                print("Q ",terminator:"")
            }else{
                print("* ",terminator:"")
            }
        }
        print("\n")
    }
    print("\n")
}


//MARK: 背包问题 有问题
public var maxW = 0
/**
 * 123
 */
public func bag(_ i:Int,_ cw:Int,_ items:[Int],_ weight:Int,_ n:Int){
    if cw == weight || i == n {
        if cw > maxW {
            maxW = cw
        }
        return
    }
    
    bag(i + 1, cw, items, weight, n)//第一个
    
    if cw + items[i] <= weight {
        bag(i+1, cw+items[i], items, weight, n)
    }
}



