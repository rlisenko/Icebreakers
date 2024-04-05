//
//  ContentView.swift
//  CustomCameraApp
//
//  Created by Amisha Italiya on 03/10/23.
//

import SwiftUI

struct CameraView: View {
    
    @ObservedObject var cameraViewModel = CameraViewModel()
    
    @State private var isFocused = false
    @State private var isScaled = false
    @State private var focusLocation: CGPoint = .zero
    @State private var currentZoomFactor: CGFloat = 1.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                //				Color.black.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    //					Button(action: {
                    //						viewModel.switchFlash()
                    //					}, label: {
                    //						Image(systemName: viewModel.isFlashOn ? "bolt.fill" : "bolt.slash.fill")
                    //							.font(.system(size: 20, weight: .medium, design: .default))
                    //					})
                    //					.accentColor(viewModel.isFlashOn ? .yellow : .white)
                    
                    ZStack {
                        CameraPreview(session: cameraViewModel.session) { tapPoint in
                            isFocused = true
                            focusLocation = tapPoint
                            cameraViewModel.setFocus(point: tapPoint)
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        }
                        .gesture(MagnificationGesture()
                            .onChanged { value in
                                self.currentZoomFactor += value - 1.0 // Calculate the zoom factor change
                                self.currentZoomFactor = min(max(self.currentZoomFactor, 0.5), 10)
                                self.cameraViewModel.zoom(with: currentZoomFactor)
                            })
                        //						.animation(.easeInOut, value: 0.5)
                        
                        if isFocused {
                            FocusView(position: $focusLocation)
                                .scaleEffect(isScaled ? 0.8 : 1)
                                .onAppear {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0)) {
                                        self.isScaled = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                            self.isFocused = false
                                            self.isScaled = false
                                        }
                                    }
                                }
                        }
                    }
                    .frame(width: 300, height: 300)
                    Spacer()
                    
                    HStack {
                        PhotoThumbnail(image: $cameraViewModel.capturedImage)
                        Spacer()
                        CaptureButton { cameraViewModel.captureImage() }
                        Spacer()
                        CameraSwitchButton { cameraViewModel.switchCamera() }
                    }
                    .padding(20)
                }
                
            }
            .alert(isPresented: $cameraViewModel.showAlertError) {
                Alert(title: Text(cameraViewModel.alertError.title), message: Text(cameraViewModel.alertError.message), dismissButton: .default(Text(cameraViewModel.alertError.primaryButtonTitle), action: {
                    cameraViewModel.alertError.primaryAction?()
                }))
            }
            .alert(isPresented: $cameraViewModel.showSettingAlert) {
                Alert(title: Text("Warning"), message: Text("Application doesn't have all permissions to use camera and microphone, please change privacy settings."), dismissButton: .default(Text("Go to settings"), action: {
                    self.openSettings()
                }))
            }
            .onAppear {
                cameraViewModel.setupBindings()
                cameraViewModel.requestCameraPermission()
            }
        }
    }
    
    func openSettings() {
        let settingsUrl = URL(string: UIApplication.openSettingsURLString)
        if let url = settingsUrl {
            UIApplication.shared.open(url, options: [:])
        }
    }
}

struct PhotoThumbnail: View {
    @Binding var image: UIImage?
    
    var body: some View {
        Group {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
            } else {
                Rectangle()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.black)
            }
        }
    }
}

struct CaptureButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 10/255, green: 13/255, blue: 42/255), Color(red: 69/255, green: 67/255, blue: 119/255)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 70, height: 70, alignment: .center)
                    .overlay(
                        Circle()
                            .fill(Color.clear)
                            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 4, y: 4)
                    )
                
                    .overlay(
                        Circle()
                            .stroke(Color("bluishGreen"), lineWidth: 9)
                            .frame(width: 70, height: 70, alignment: .center)
                    )
                    .overlay(
                        Circle()
                            .fill(Color.clear)
                            .shadow(color: Color(red: 84/255, green: 83/255, blue: 141/255), radius: 4, x: -2, y: -2)
                    )
                Image(systemName: "camera.shutter.button")
                    .font(.system(size: 32, weight: .bold))
                //                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(.bottom, 5)
            }
        }
    }
}

struct CameraSwitchButton: View {
    var action: () -> Void
    
    var body: some View {
           Button(action: action) {
               Rectangle()
                   .cornerRadius(15)
                   .foregroundStyle(Color("TabButtonBackground"))
                   .frame(width: 45, height: 45, alignment: .center)
                   .overlay(
                       RoundedRectangle(cornerRadius: 15)
                           .strokeBorder(
                               LinearGradient(
                                   gradient: Gradient(colors: [Color("ButtonGradient"), .black.opacity(0.5)]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing
                               ),
                               lineWidth: 2
                           )
                   )
                   .overlay(
                       Image(systemName: "camera.rotate.fill")
                           .foregroundStyle(Color("TabIconColor")))
//                   .shadow(color: Color(red: 41/255, green: 39/255, blue: 130/255).opacity(0.35), radius: 3, x: 0, y: 3)
           }
       }
}

struct FocusView: View {
    
    @Binding var position: CGPoint
    
    var body: some View {
        Circle()
            .frame(width: 70, height: 70)
            .foregroundColor(.clear)
            .border(Color.yellow, width: 1.5)
            .position(x: position.x, y: position.y)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
