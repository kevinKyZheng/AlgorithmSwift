//
//  AdjacencyListGraph.swift
//  LinkedList
//
//  Created by ios on 2019/3/22.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

private class EdgeList<T> where T:Hashable{
    var vertex : Vertex<T>
    var edges: [Edge<T>]?
    
    init(vertex:Vertex<T>) {
        self.vertex = vertex
    }
    
    func  addEdge(_ edge:Edge<T>){
        edges?.append(edge)
    }
}
open class AdjacencyListGraph<T>:AbstractGraph<T> where T:Hashable{
    fileprivate var adjacencyList:[EdgeList<T>] = []

    public required init() {
        super.init()
    }

    public required init(fromGraph graph: AbstractGraph<T>) {
        super.init(fromGraph: graph)
    }

    open override var vertices: [Vertex<T>]{
        var vertices = [Vertex<T>]()
        for edgeList in adjacencyList{
            vertices.append(edgeList.vertex)
        }
        return vertices
    }

    open override var edges: [Edge<T>]{
        var allEdges = Set<Edge<T>>()

        for edgeList in adjacencyList{
            guard let edges = edgeList.edges else{
                continue
            }

            for edge in edges{
                allEdges.insert(edge)
            }
        }
        return Array(allEdges)
    }

    open override func createVertex(_ data: T) -> Vertex<T> {
        let matchingVerices = vertices.filter { $0.data == data }

        if matchingVerices.count > 0{
            return matchingVerices.last!
        }

        let vertex = Vertex(data:data,index:adjacencyList.count)
        adjacencyList.append(EdgeList(vertex: vertex))
        return vertex
    }

    open override func addDirectedEdge(_ from: Vertex<T>, _ to: Vertex<T>, withWeight weight: Double?) {
        let edge = Edge(from:from,to:to,weight:weight)

        let edgeList = adjacencyList[from.index]

        if edgeList.edges != nil{
            edgeList.addEdge(edge)
        }else{
            edgeList.edges = [edge]
        }
    }
    public override var description: String{
        var rows = [String]()
        for edgeList in adjacencyList {

            guard let edges = edgeList.edges else {
                continue
            }

            var row = [String]()
            for edge in edges {
                var value = "\(edge.to.data)"
                if edge.weight != nil {
                    value = "(\(value): \(edge.weight!))"
                }
                row.append(value)
            }

            rows.append("\(edgeList.vertex.data) -> [\(row.joined(separator: ", "))]")
        }

        return rows.joined(separator: "\n")
    }
    

}
