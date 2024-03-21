//
//  TakePicView.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 3/20/24.
//

import SwiftUI


struct TakePicView: View {
//    @State var isCameraShowing: Bool
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            AccessCameraView(selectedImage: self.$selectedImage)
                .frame(width: 400, height: 400)
            Button {
                
            } label: {
                Text("click")
            }
        }
    }
}

#Preview {
    TakePicView()
}
