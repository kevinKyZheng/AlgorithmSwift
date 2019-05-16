//
//  String+.swift
//  Algorithm
//
//  Created by ios on 2019/4/22.
//  Copyright © 2019年 WT. All rights reserved.
//

import Foundation

extension String{
    func indexOf(_ pattern:String) -> String.Index?{
        for i in self.indices{
            var j = i
            var found = false
            for p in self.indices{
                if j == self.endIndex || self[j] != pattern[p]{
                    found = false
                    break
                }else{
                    j = self.index(after: j)
                }
            }
            if found{
             return i
            }
        }
        return nil
    }
}
