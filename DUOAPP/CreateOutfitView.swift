//
//  CreateOutfitView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 08/11/2020.
//

import SwiftUI

struct CreateOutfitView: View {
    
    var categories: [ItemCategory]
    @State var please: Bool = AppData.getUserIsCreating()
    
    @State var data = AppData()
    
    init(){
        self.categories = AppData.selectedItemsCategories()
    }
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 20){
                    ForEach(categories, id: \.id){ category in
                        CarouselView(items: AppData.selectedItemsForCreatingOutfit.filter{$0.category == category})
                    }
                }.navigationBarTitle("Create outfit")
            }
            HStack{
                Spacer()
                if please {
                    NavigationLink(
                        destination: ClosetView().onAppear{ AppData.userIsreatingOutfit = true },
                        label: {
                            Text("Add items")
                                .foregroundColor(.white)
                                .frame(width: 150, height: 50)
                                .background(Color.gray)
                                .cornerRadius(15)
                        })
                    Spacer()
                    Button(action: {
                        data.saveOutfit()
                    }, label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(Color.gray)
                            .cornerRadius(15)
                    })
                }else{
                    NavigationLink(
                        destination: OutfitsView(),
                        label: {
                            Text("Go to outfits")
                                .foregroundColor(.white)
                                .frame(width: 150, height: 50)
                                .background(Color.gray)
                                .cornerRadius(15)
                        })
                }
                Spacer()
            }
        }
    }
}

struct CreateOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CreateOutfitView()
        }
    }
}


