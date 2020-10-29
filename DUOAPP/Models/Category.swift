//
//  Category.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import Foundation

class Category: Identifiable {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
