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
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                GeometryReader { reader in
                    Color("bluishGreen")
                        .frame(height: reader.safeAreaInsets.top * 1.1, alignment: .top)
                        .ignoresSafeArea()
                }
                VStack {
                    Spacer()
                    ZStack(alignment: .top) {
                        
//                        Spacer(minLength: 20)
                        
                        AccessCameraView(selectedImage: self.$selectedImage)
                            .frame(width: 290, height: 475)
//                        EnterNameSheet(image: $selectedImage)
                        Image("PolaroidClear")
                        //                .frame(width: 400)
                        
                        
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
    }
}

#Preview {
    TakePicView()
        .environmentObject(ViewModel())
}
