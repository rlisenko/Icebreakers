//
//  PassingUIImage.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 4/8/24.
//

import SwiftUI

struct PassingUIImage: View {
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            // Assuming you have a way to select an image and set it to `selectedImage`
            Button("Select Image") {
                // Code to select an image and set it to selectedImage
            }
            
            // Pass the optional UIImage to ImageView
            ImageView(image: selectedImage)
        }
    }
}

struct ImageView: View {
    var image: UIImage?
    
    var body: some View {
        if let image = image {
            // Convert the UIImage to SwiftUI Image
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            // Show a placeholder or empty view if the UIImage is nil
            Text("No Image Selected")
        }
    }
}

#Preview {
    PassingUIImage()
}
