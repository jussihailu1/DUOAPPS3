//
//  ClosetView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import SwiftUI

struct ClosetView: View {
    var body: some View {
        
            VStack(spacing: 20 ){
                Spacer()
                
                HStack{
                    VStack{
                        ForEach(AppData.categories.prefix(3), id: \.id){ category in
                            NavigationLink(
                                destination: FilterView(chosenCategory: category),
                                label: {
                                    Text(category.name).frame(width: 150, height: 40)
                                        .background(Color.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(10).padding()
                                })
                        }
                    }
                    VStack{
                        ForEach(AppData.categories.suffix(3), id: \.id){ category in
                            NavigationLink(
                                destination: FilterView(chosenCategory: category),
                                label: {
                                    Text(category.name).frame(width: 150, height: 40)
                                        .background(Color.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(10).padding()
                                })
                        }
                    }
                }
                Spacer()
            }.navigationBarTitle("Closet", displayMode: .inline)
          
    }
}

struct ClosetView_Previews: PreviewProvider {
    static var previews: some View {
        ClosetView()
    }
}
