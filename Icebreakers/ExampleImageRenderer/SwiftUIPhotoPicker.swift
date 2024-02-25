//
//  SwiftPhotoPicker.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 4/26/23.
//

import SwiftUI
import PhotosUI

struct SwiftUIPhotoPicker: View {
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var image: Image?
       
       var body: some View {
           NavigationStack {
               ZStack {
                   image?
                       .resizable()
                       .scaledToFit()
               }
               .toolbar {
                   PhotosPicker(selection: $selectedPhoto) {
                       Image(systemName: "pencil")
                   }
               }
           }
       }
}

struct SwiftUIPhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPhotoPicker()
    }
}
