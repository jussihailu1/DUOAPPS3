//
//  NewItemViewModel.swift
//  DUOAPP
//
//  Created by Efaliso Tamerat on 11/11/2020.
//

import Foundation

class NewItemViewModel : ObservableObject{
    
    @Published var name = ""
    
    // New data
    @Published var isNewItem = false
}
