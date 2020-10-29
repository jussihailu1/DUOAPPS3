//
//  HomeView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                NavigationLink(
                    destination: ClosetView(),
                    label: {
                        Text("Closet")
                            .padding(.horizontal, 75).padding(.vertical, 50).background(Color.gray)
                            .cornerRadius(15).foregroundColor(Color.white)
                            .font(.headline)
                    })
                Spacer()
                NavigationLink(
                    destination: AddItemView(),
                    label: {
                        Text("Add new item")
                            .padding(50).background(Color.gray)
                            .cornerRadius(15).foregroundColor(Color.white)
                            .font(.headline)
                    })
                Spacer()
            }.navigationBarTitle("APPNAME")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
