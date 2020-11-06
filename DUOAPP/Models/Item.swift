//
//  Item.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import Foundation

struct Item {
    
    var id: Int
    var name: String
    var category: Category
    var tags: [Tag]
    var image: String
    
    init(id: Int, name: String, category: Category) {
        self.id = id
        self.name = name
        self.category = category
        self.tags = []
        self.image = name + ".png"
    }
}
