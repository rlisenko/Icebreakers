//
//  EnterInfoView.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 4/21/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct EnterNameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var socialHandle = ""
    @State private var doneSaving = false
    @FocusState private var isFocused: Bool
    @FocusState private var isNameFocused: Bool
    @FocusState private var keyboardFocused: Bool
//    var selectedImage: UIImage?
    @Binding var image: Image?
    @State private var alternateText = "" // New state variable to store alternate text
    @State private var useAlternateText = false // Toggle state
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { reader in
                Color("bluishGreen")
                    .frame(height: reader.safeAreaInsets.top * 1.1, alignment: .top)
                    .ignoresSafeArea()
            }
            VStack {
                Spacer()
                
                HStack {
                
                ZStack {
                    Image("polaroidstockphoto")
                        .resizable()
                        .frame(width: 170, height: 200)
                    image?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.bottom, 30)
                    Text(name)
                        .font(.custom("PermanentMarker-Regular", size: 14))
                        .foregroundStyle(.black)
                        .padding(.top, 145)
                    Text(socialHandle)
                        .font(.caption2)
                        .foregroundStyle(.blue)
                        .padding(.top, 175)
                }
                .padding()
                    VStack {
                        Text("Send With My Info")
                        Text("Add Notes")
                        Text("Mastodon Lookup")
                    }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Mastodon Handle")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    TextField("handle", text: $socialHandle)
                        .padding()
                        .background(isFocused ? Color(.systemGray4) : Color(.systemGray6)) // lighter color when focused
                        .cornerRadius(15)
                        .focused($isFocused)
                        .focused($keyboardFocused)
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 30)
                .onChange(of: isFocused) { newValue in
                    if newValue {
                        withAnimation {
                            isFocused = newValue
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    TextField("Name", text: $name)
                        .padding()
                        .background(isNameFocused ? Color(.systemGray4) : Color(.systemGray6)) // lighter color when focused
                        .cornerRadius(15)
                        .focused($isNameFocused)
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .onChange(of: isNameFocused) { newValue in
                    if newValue {
                        withAnimation {
                            isNameFocused = newValue
                        }
                    }
                }
                
                //                NavigationLink {
                //                    PolaroidDetailView(image: image!, name: name, socialHandle: socialHandle, doneSaving: $doneSaving)
                //                } label: {
                //
                //                        HStack {
                //                            Spacer()
                //                            Text("Add To Picture")
                //                            Spacer()
                //                        }
                //                        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                //                    }
                //                    .disabled(image == nil)
                //                    .font(.system(.title2, design: .rounded, weight: .bold))
                //                    .foregroundColor(.white)
                ////                    .background(Capsule().stroke(.yellow, lineWidth: 2))
                //                    .background(Capsule().fill(Color("Gamboge")))
                //                    .padding()
            }
            //                .padding([.bottom])
        }
        .navigationBarBackButtonHidden(true)
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Retake")
                    }
                    .fontWeight(.semibold)
                }
            }
        }
        .navigationTitle("Capture Their Info")
        .tint(.white)
        
        .onChange(of: doneSaving) { newValue in
            guard newValue == true else { return }
            dismiss()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                keyboardFocused = true
            }
        }
        .preferredColorScheme(.dark)
        
    }
}

struct EnterNameSheet_Previews: PreviewProvider {
    @State private static var image: Image? = Image("UnfrozenMasto")
    
    static var previews: some View {
                EnterNameView(image: $image)
//        EnterNameView()
    }
}
