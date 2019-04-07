//
//  Edge.swift
//  LinkedList
//
//  Created by ios on 2019/3/22.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

public struct Edge<T>:Equatable where T : Hashable{
    public static func == (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        guard lhs.from == rhs.from else {
            return false
        }
        guard lhs.to == rhs.to else {
            return false
        }
        guard lhs.weight == rhs.weight else{
            return false
        }
        return true
    }
    
    public let from :Vertex<T>
    public let to:Vertex<T>
    
    public let weight:Double?
}

//extension Edge:Hashable{
//    public var hashValue:Int{
//        var string = "\(from.description)\(to.description)"
//        if weight != nil {
//            string.append("\(weight!)")
//        }
//        return string.hashValue
//    }
//}
