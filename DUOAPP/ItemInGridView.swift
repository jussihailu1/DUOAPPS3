//
//  ItemInGridView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 05/11/2020.
//

import SwiftUI

struct ItemInGridView: View {
    
    let item: Item
    
    var body: some View {
        VStack{
            Image(item.name)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            Text(item.name)
        }
    }
}

struct ItemInGridView_Previews: PreviewProvider {
    static var previews: some View {
        ItemInGridView(item: AppData.items[1])
    }
}
