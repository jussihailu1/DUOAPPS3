//
//  CreateOutfitView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 08/11/2020.
//

import SwiftUI

struct CreateOutfitView: View {
    
    //    let selectedItemsForOutfitComparison: [Item] = []
    
    var body: some View {
        VStack(spacing: 20){
            ForEach(AppData.categories, id: \.id){ category in
                CarouselView(items: AppData.itemsByCategory(category: category))
            }
        }
    }
}

struct CarouselView: View{
    
    let items: [Item]
    
    @State var dragged: CGSize = CGSize.zero
    @State var accumulated: CGSize = CGSize.zero
    @State var activeItemIndex: CGFloat = 0
    let minimumDragAmount: CGFloat = 50
    let widthOfHiddenCards: CGFloat = 90
    let cardHeight: CGFloat = 150
    let spacing: CGFloat = 30
    var padding: CGFloat { return widthOfHiddenCards + spacing }
    var numberOfCarouselItems: CGFloat {return CGFloat(items.count)}
    var startOffsetX: CGFloat {return (carouselWidth - UIScreen.main.bounds.width) / 2}
    var cardWidth: CGFloat {
        return UIScreen.main.bounds.width - (widthOfHiddenCards * 2) - (spacing * 2)
    }
    var carouselWidth: CGFloat {
        return (cardWidth * numberOfCarouselItems) + (spacing * (numberOfCarouselItems - 1))
    }
    
    @State var itemOpacity: Double = 1
//    func setItemOpacity (id: CGFloat) -> Void{
//        let index: Int = items.firstIndex(where: {CGFloat($0.id) == id})!
//        if CGFloat(index).isEqual(to: activeItemIndex){
//            self.itemOpacity = 1
//        }else{
//            self.itemOpacity = 0.5
//        }
//    }
    
//    TODO: OPACITY SHIT FIKSEN
    
    var body: some View{
        HStack(spacing: self.spacing) {
            ForEach(self.items, id: \.id){ item in
                ItemInOutfitView(item: item, cardSize: CGSize(width: self.cardWidth, height: self.cardHeight), opacity: self.itemOpacity)
                    .offset(x: self.dragged.width)
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                self.dragged = CGSize(width: value.translation.width + self.accumulated.width, height: 0)
                            }
                            .onEnded{ value in
                                withAnimation{
                                    if value.translation.width < -self.minimumDragAmount {
                                        self.activeItemIndex = self.activeItemIndex - 1
                                        self.dragged.width = (self.activeItemIndex * (cardWidth + spacing))
                                        self.accumulated = self.dragged
//                                        self.setItemOpacity(id: self.activeItemIndex - 1)
                                    }else{
                                        self.dragged = self.accumulated
                                        
                                    }
                                    if value.translation.width > self.minimumDragAmount {
                                        self.activeItemIndex = self.activeItemIndex + 1
                                        self.dragged.width = (self.activeItemIndex * (cardWidth + spacing))
                                        self.accumulated = self.dragged
//                                        self.setItemOpacity(id: self.activeItemIndex - 1)
                                    }else{
                                        self.dragged = self.accumulated
                                    }
                                }
                            }
                    )
            }
        }.offset(x: self.startOffsetX + self.padding)
    }
}

struct CreateOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        CreateOutfitView()
    }
}
