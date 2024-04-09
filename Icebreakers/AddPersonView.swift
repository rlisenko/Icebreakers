//
//  AddPersonView.swift
//  ConferenceBuddy
//
//  Created by Rob Lisenko on 3/8/23.
//

import Foundation
import SwiftUI
import PhotosUI
//import Camera_SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var myInfo: ViewModel
    
    @State private var isShowingEnterInfoView = false
    @State private var isShowingPolaroidMyInfoView = false
    @State private var image: Image?
//    @State private var inputImage: UIImage?
    @State private var selectedPhoto: PhotosPickerItem?
    @Binding var tabselection: Int
    
    @State private var isShowingImagePicker = false
    @State private var isCameraShowing = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                GeometryReader { reader in
                    Color("ClearBlue")
                        .frame(height: reader.safeAreaInsets.top * 1, alignment: .top)
                        .ignoresSafeArea()
                }
                VStack {
                    ExtractedView(selectedPhoto: $selectedPhoto, isCameraShowing: $isCameraShowing)
                        .sheet(isPresented: $isCameraShowing) {
                            //                        CameraView()
                        }
                        .task(id: selectedPhoto) {
                            image = try? await selectedPhoto?.loadTransferable(type: Image.self)
                            guard image != nil else { return }
//                            print(tabselection)
//                            if tabselection == 1 {
//                                isShowingPolaroidMyInfoView = true
//                                
//                            } else {
                                isShowingEnterInfoView = true
//                            }
                        }
                        .sheet(isPresented: $isShowingEnterInfoView) {
                            EnterNameView(image: $image)
//                            EnterNameView()
                            
                        }
                        .sheet(isPresented: $isShowingPolaroidMyInfoView) {
                            PolaroidMyInfoView(image: $image, name: "Rob Lisenko", socialHandle: "@roblisenko@iosdev.space")
                        }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("IceBreaker 🐘").font(.largeTitle)       
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
//    func setImage(uiImage: UIImage?) {
//        guard let uiImage = uiImage else { return }
//        
//        image = Image(uiImage: uiImage)
//    }
}

struct AddPersonView_Previews: PreviewProvider {
    @State static var tabselection = 0
    
    static var previews: some View {
        AddPersonView(tabselection: $tabselection)
    }
}

struct ExtractedView: View {
    @Binding var selectedPhoto: PhotosPickerItem?
    @Binding var isCameraShowing: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            PhotosPicker(selection: $selectedPhoto) {
                
                ZStack {
                    Color("bluishGreen")
                        .cornerRadius(30)
                    VStack {
                        Image(systemName: "photo.fill.on.rectangle.fill")
                            .resizable()
                            .frame(width: 100, height: 80)
                            .padding(20)
                        Text("Selfie from Camera Roll")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
                .padding(20)
                .frame(width: 250, height: 275)
            }
            //            CameraView() {
            ZStack {
                Color("Gamboge")
                    .cornerRadius(30)
                VStack {
                    Image(systemName: "camera.fill")
                        .resizable()
                    
                        .frame(width: 100, height: 80)
                        .padding(20)
                    
                    Text("Take New Selfie (coming soon)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .padding(20)
            .frame(width: 250, height: 275)
//        }
            .onTapGesture {
                isCameraShowing = true
                // CameraView()  // Why is this not in scope?
            }
            Spacer()
        }
    }
}
