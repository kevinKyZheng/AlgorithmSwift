//
//  Graph.swift
//  LinkedList
//
//  Created by ios on 2019/3/22.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

open class AbstractGraph<T>:CustomStringConvertible where T:Hashable{
    public var description: String{
        fatalError("abstract property accessed")
    }
    

    public required init(){}
    
    public required init(fromGraph graph:AbstractGraph<T>){
        for edeg in graph.edges{
            let from = createVertex(edeg.from.data)
            let to = createVertex(edeg.to.data)
            
            addDirectedEdge(from, to, withWeight: edeg.weight)
        }
    }
    
    open var vertices:[Vertex<T>]{
        fatalError("abstract property accessed")
    }
    open var edges:[Edge<T>]{
        fatalError("abstract property accessed")
    }
    
    open func createVertex(_ data:T)->Vertex<T>{
        fatalError("abstract property accessed")
    }
    open func addDirectedEdge(_ from:Vertex<T>,_ to:Vertex<T>,withWeight weight:Double?){
        fatalError("abstract property accessed")
    }
}
