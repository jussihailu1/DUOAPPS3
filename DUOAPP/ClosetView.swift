//
//  ClosetView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import SwiftUI

struct ClosetView: View {
    var body: some View {
            
        let categories = AppData.categories
        
            VStack(spacing: 20 ){
                Spacer()
                
                ForEach(categories, id: \.id){ category in
                    NavigationLink(
                        destination: FilterView(chosenCategory: category),
                        label: {
                            Text(category.name).frame(width: 200, height: 40)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                }
                
                Spacer()
                NavigationLink(
                    destination: FilterView(chosenCategory: Category(id: 0, name: "")),
                    label: {
                        Text("Search by tags").frame(width: 200, height: 40)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                Spacer()
            }.navigationBarTitle("Closet", displayMode: .inline)
          
    }
}

struct ClosetView_Previews: PreviewProvider {
    static var previews: some View {
        ClosetView()
    }
}
