//
//  OutfitsView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 05/11/2020.
//

import SwiftUI

struct OutfitsView: View {
    
    @State var selection: Int? = nil
    
    var body: some View {
        VStack{
            Text("Some textfield or sorting options")
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], alignment: .center, spacing: 20){
                    ForEach(AppData.outfits, id: \.id) { outfit in
                        VStack{
                            ForEach(outfit.items, id: \.id){item in
                                ItemInOutfitView(item: item, cardSize: CGSize(width: 100, height: 100))
                            }
                        }.background(Color.gray).cornerRadius(15).shadow(radius: 10)
                    }
                }
            }
            NavigationLink(destination: CreateOutfitView(), tag: 1, selection: $selection) {
                Button(action: {
                    AppData.userIsreatingOutfit = true
                    self.selection = 1
                }) {
                    Text("Create outfit")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(Color.gray)
                        .cornerRadius(15)
                }
            }
        }.navigationBarTitle("Outfits", displayMode: .inline)
    }
}

struct OutfitsView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitsView()
    }
}
