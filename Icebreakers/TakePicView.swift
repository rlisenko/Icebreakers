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
    @StateObject var cameraModel: CameraViewModel = CameraViewModel()
    
    @State private var isShowingAddView = false
    @State private var image: Image?
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(.systemGray2)
                    .ignoresSafeArea()
                GeometryReader { reader in
                    Color("bluishGreen")
                        .frame(height: reader.safeAreaInsets.top * 1.1, alignment: .top)
                        .ignoresSafeArea()
                }
                
                VStack {
                    NavigationLink("EnterNameViewing") {
                        //Temporary link for testing passing Model, link will need to be ran by Capturing image
                        EnterNameView(cameraViewModel: cameraModel)
                    }
                    Spacer()
                    ZStack(alignment: .top) {
                        ///Passing Model to CameraView that original created this Model
                        CameraView(cameraViewModel: cameraModel)
                            .frame(width: 350, height: 600)
                        Image("PolaroidClear")
                            .resizable()
                            .frame(width: 300,height: 410)
                            .shadow(radius: 5.0)
                        
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    Text("Selfie with Them 🤳").font(.largeTitle)
                                }
                            }
                    }
                    Spacer()
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
