//
//  AddItemView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import SwiftUI



struct ItemBody: Identifiable {
    var id: Int
    var name: String
    var tagsString: String
    var tagsArray: [String]
    var image: String?
    var category: ItemCategory
    
    init(){
        id = 75
        name = ""
        tagsString = ""
        tagsArray = []
        image = ""
        category = ItemCategory.init()
    }
    
}

struct AddItemView: View {
    let chosenCategory: ItemCategory
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    @State private var newItem: Item = Item()
    @State var itemBody: ItemBody = ItemBody()
    
    
    var body: some View {
        
        VStack{
            Image(uiImage: (image ?? UIImage(named: "placeholder"))!)
                .resizable().frame(width: 250, height: 250)
            Button("Choose picture"){
                self.showSheet = true
            }.padding()
            .actionSheet(isPresented: $showSheet) {
                ActionSheet(title: Text("Select photo"),
                            message: Text("Choose"),  buttons:[
                                .default(Text("Photo Library")){
                                    self.showImagePicker = true
                                    self.sourceType = .photoLibrary
                                },
                                .default(Text("Camera")){
                                    self.showImagePicker = true
                                    self.sourceType = .camera
                                }, .cancel()])

            }
            TextField("Enter name...", text: self.$itemBody.name)
            TextField("Enter tags, devided by a comma", text: self.$itemBody.tagsString)
            
            Button("Add new item"){
                self.itemBody.image = self.image?.description
                self.newItem = Item(id: self.itemBody.id, name: self.itemBody.name, tags: self.itemBody.tagsString.components(separatedBy: ", "), image: self.itemBody.image!, category: self.chosenCategory)
                print(self.$newItem)
            }
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image,isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(chosenCategory: AppData.categories[2])
    }
}
