//
//  Category.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import Foundation

struct Category: Identifiable, Equatable {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    init() {
        self.id = 0
        self.name = ""
    }
}
