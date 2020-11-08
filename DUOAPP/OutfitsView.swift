//
//  OutfitsView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 05/11/2020.
//

import SwiftUI

struct OutfitsView: View {
    var body: some View {
        VStack{
            Text("Some textfield or sorting options")
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 20){
                    ForEach(AppData.outfits, id: \.id) { outfit in
                        VStack{
                            ForEach(outfit.items, id: \.id){item in
                                ItemInOutfitView(item: item)
                            }
                        }.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            NavigationLink(
                destination: CreateOutfitView(),
                label: {
                    Text("Create outfit")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(Color.gray)
                        .cornerRadius(15)
                })
        }.navigationBarTitle("Outfits")
    }
}



struct OutfitsView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitsView()
    }
}
