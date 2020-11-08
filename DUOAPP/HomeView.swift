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
                            .padding(50).background(Color.gray)
                            .cornerRadius(15).foregroundColor(Color.white)
                            .font(.headline)
                    }
                )
                Spacer()
//                Button(action: {AppData.userStartedCreatingOutfit()}, label: {
//                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//                })
                Spacer()
                NavigationLink(
                    destination: OutfitsView(),
                    label: {
                        Text("Outfits")
                            .padding(50).background(Color.gray)
                            .cornerRadius(15).foregroundColor(Color.white)
                            .font(.headline)
                    }
                )
                Spacer()
            }.navigationBarTitle("[APPNAME]")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

// hardware
// webservice -> API (maybe weer)
// OO dingen bewijzen met klassendiagram enzo
