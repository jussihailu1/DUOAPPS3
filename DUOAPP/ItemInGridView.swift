//
//  ItemInGridView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 05/11/2020.
//

import SwiftUI

struct ItemInGridView: View {
//    TODO: might be able to fix navlink/gesture issue by adding layer on top of grid item with and change its hidden status. This extra layer on top contains the on tap action while the card itself contains the navlink action
    
    @State var item: Item
    let selecting: Bool
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image(item.name)
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text(item.name)
            }
            
            if selecting{
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            if self.selecting {
                                item.selected = !item.selected
                                if item.selected {
                                    AppData.selectedItemsForCreatingOutfit.append(item)
                                }else{
                                    AppData.selectedItemsForCreatingOutfit.remove(at: AppData.selectedItemsForCreatingOutfit.firstIndex(where: { $0.id == item.id})!
                                    )
                                }
                            }
                        }, label: {
                            Text(AppData.selectedItemsForCreatingOutfit.count.description).foregroundColor(.white)
                                .frame(width: 20, height: 20)
                                .background(item.selected ? Color.blue : Color.gray).cornerRadius(20)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 2))
                        })
                        
//                            .onTapGesture{
//                                    item.selected = !item.selected
//                                    if item.selected {
//                                        data.selectedItemsForCreatingOutfit.append(item)
//                                    }else{
//                                        data.selectedItemsForCreatingOutfit.remove(at: AppData.selectedItemsForCreatingOutfit.firstIndex(where: { $0.id == item.id})!
//                                        )
//                                    }
//
//                            }
                    }
                    Spacer()
                }
            }
        }
        .frame(width: 100, height: 160)
        .padding(5)
        .background(Color.gray)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct ItemInGridView_Previews: PreviewProvider {
    static var previews: some View {
        ItemInGridView(item: AppData.items[10], selecting: true)
    }
}
