//
//  Vertex.swift
//  LinkedList
//
//  Created by ios on 2019/3/22.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation


public struct Vertex<T>:Equatable where T: Hashable{
    public var data: T
    public let index: Int
}

//extension Vertex:Hashable{
//    public var hasValue:Int{
//        return "\(data)\(index)".hashValue
//    }
//}
//
//extension Vertex:CustomStringConvertible{
//    public var description:String{
//        return "\(index)\(data)"
//    }
//}

