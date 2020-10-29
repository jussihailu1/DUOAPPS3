//
//  Item.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import Foundation

class Item {
    
    var name: String
    var category: Category
    var tags: [Tag]
    var image: String
    
    init(name: String, category: Category) {
        self.name = name
        self.category = category
        self.tags = []
        self.image = ""
    }
}
