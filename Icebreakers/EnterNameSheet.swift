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
    
    @State private var name = ""
    @State private var socialHandle = ""
    @State private var doneSaving = false
    @FocusState private var isFocused: Bool
    @FocusState private var isNameFocused: Bool
    @FocusState private var keyboardFocused: Bool
    //    @Binding var image: Image?
    @State private var image: Image? = Image("UnfrozenMasto")
    @State private var alternateText = "" // New state variable to store alternate text
    @State private var useAlternateText = false // Toggle state
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { reader in
                Color("bluishGreen")
                    .frame(height: reader.safeAreaInsets.top * 1.9, alignment: .top)
                    .ignoresSafeArea()
                Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                    Text("Capture Their Info").tag(1)
                    Text("Send With My Info").tag(2)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
            }
            VStack {
                Spacer()
                //                VStack(alignment: .leading) {
                //                    Toggle("",isOn: $useAlternateText)
                //                        .padding(.leading)
                ZStack {
                    //these do not need to be full size, would free up more space to fit onscreen keyboard
                    Image("polaroidstockphoto")
                        .resizable()
                        .frame(width: 170, height: 200)
                    image?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.bottom, 30)
                }
                .padding()
                //                }
                
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
                //                .padding(30)
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
        //        EnterNameView(image: $image)
        EnterNameView()
    }
}
