//
//  ItemInOutfitView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 06/11/2020.
//

import SwiftUI

struct ItemInOutfitView: View {
    
    let item: Item
    let cardSize: CGSize
    let opacity: Double
    
    init(item: Item){
        self.item = item
        self.cardSize = CGSize(width: 100, height: 100)
        self.opacity = 1
    }
    
    init(item: Item, cardSize: CGSize, opacity: Double){
        self.item = item
        self.cardSize = cardSize
        self.opacity = opacity
    }
    
    var body: some View {
        Image(item.name)
            .resizable()
            .scaledToFit()
            .frame(width: self.cardSize.width, height: self.cardSize.height)
            .opacity(self.opacity)
    }
}

struct ItemInOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        ItemInOutfitView(item: AppData.items[20])
    }
}
