//
//  FilterView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 24/10/2020.
//

import SwiftUI

struct FilterView: View {
    
    let chosenCategory: Category
    
    var filteredItems: [Item] {
        return AppData.items.filter {$0.category == chosenCategory}
    }
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 20){
                ForEach(filteredItems, id: \.id){ item in
                    NavigationLink(
                        destination: ItemView(item: item),
                        label: {
                            ItemInGridView(item: item)
                        })
                }
            }.padding()
        }.navigationBarTitle(chosenCategory.name)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FilterView(chosenCategory: AppData.categories[2])
        }
    }
}
