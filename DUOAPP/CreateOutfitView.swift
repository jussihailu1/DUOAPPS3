//
//  CreateOutfitView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 08/11/2020.
//

import SwiftUI

struct CreateOutfitView: View {
    
    var categories: [ItemCategory] {  Array(Set(AppData.selectedItemsForCreatingOutfit.map{ $0.category }))}
    
//    func hem() -> [Item] {
//
//    }
    
    var body: some View {
        VStack(spacing: 20){
            ForEach(categories, id: \.id){ category in
                CarouselView(items: AppData.selectedItemsForCreatingOutfit.filter{$0.category == category})
            }
            NavigationLink(
                destination: ClosetView().onAppear{ AppData.userStartedCreatingOutfit() },
                label: {
                    Text("Add items").foregroundColor(.blue)
                })
        }.navigationBarTitle("Create outfit")
    }
}

struct CreateOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        CreateOutfitView()
    }
}


