//
//  ExampleTrivia.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 2/21/24.
//

import CoreImage
import SwiftUI
import Observation

struct TakePicView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var isShowingAddView = false
    @State private var image: Image?
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                GeometryReader { reader in
                    Color("bluishGreen")
                        .frame(height: reader.safeAreaInsets.top * 1.1, alignment: .top)
                        .ignoresSafeArea()
                }
                Color(.systemGray5)
                VStack {
                    Spacer()
                    ZStack(alignment: .top) {
//                        AccessCameraView(selectedImage: self.$selectedImage)
                        CameraView()
                            .frame(width: 350, height: 600)
                        Image("PolaroidClear")
                            .resizable()
                            .frame(width: 300,height: 410)
                                   
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    Text("Selfie with Them 🤳").font(.largeTitle)
                                }
                            }
                    }
                    Spacer()
                    VStack {
                        NavigationLink("EnterNameViewing") {
//                            EnterNameView()
                            EnterNameView(image: $image)
                        }
                    }
                }
            }
        }
        .tint(.primary)
    }
}

#Preview {
    TakePicView()
        .environmentObject(ViewModel())
}
