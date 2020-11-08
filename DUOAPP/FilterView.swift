//
//  FilterView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 24/10/2020.
//

import SwiftUI

struct FilterView: View {
    
    let chosenCategory: ItemCategory
    
    @State var selecting: Bool = false
    var filteredItems: [Item] {
        return AppData.items.filter {$0.category == chosenCategory}
    }
    
    var body: some View {
        VStack(spacing: 30){
            HStack{
                Spacer()
                if selecting {
                    NavigationLink(
                        destination: CreateOutfitView(),
                        label: {
                            Text("Continue").padding(.horizontal).padding(.vertical, 5).background(Color.blue).cornerRadius(50).foregroundColor(.white)
                        })
                    Button(action: {
                        self.selecting = false
                        AppData.selectedItemsForCreatingOutfit.removeAll()
                    }, label: {
                        Text("Cancel").padding(.horizontal).padding(.vertical, 5).background(Color.red).cornerRadius(50).foregroundColor(.white)
                    })
                }else{
                    Button(action: { self.selecting = true }, label: {
                        Text("Select").padding(.horizontal).padding(.vertical, 5).background(Color.gray).cornerRadius(50).foregroundColor(.white)
                    })
                }
            }.padding()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], spacing: 20){
                    ForEach(filteredItems, id: \.id){ item in
                        VStack{
                            if selecting {
                                ItemInGridView(item: item, selecting: self.selecting)
                            }else{
                                NavigationLink(
                                    destination: ItemView(item: item),
                                    label: {
                                        ItemInGridView(item: item, selecting: self.selecting)
                                    })
                            }
                        }
                    }
                }
                
            }
        }.padding().navigationBarTitle(chosenCategory.name)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView{
                FilterView(chosenCategory: AppData.categories[2])            }
        }
    }
}
