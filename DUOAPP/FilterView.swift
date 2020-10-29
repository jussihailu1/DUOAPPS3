//
//  FilterView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 24/10/2020.
//

import SwiftUI

struct FilterView: View {
    
    var chosenCategory: Category;
    
    var body: some View {
        Text("Hello, This is your selected category: \n \n" + chosenCategory.name)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(chosenCategory: AppData.categories[0])
    }
}
