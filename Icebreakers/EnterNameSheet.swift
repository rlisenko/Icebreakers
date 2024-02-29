//
//  EnterInfoView.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 4/21/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct EnterNameSheet: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var name = ""
    @State private var socialHandle = ""
    @State private var doneSaving = false
    @Binding var image: Image?
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    //these do not need to be full size, would free up more space to fit onscreen keyboard
                    Image("polaroidstockphoto")
                    image?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 305, height: 305)
                        .padding(.bottom, 60)
                }
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("ClearBlue"))
                    
                    VStack {
                        TextField("", text: $socialHandle)
                            .placeholder(when: socialHandle.isEmpty) {
                                Text("Mastodon Username")
                                    .padding(10)
                                    .foregroundColor(Color("ClearBlue"))
                                    .background(.white)
                                    .italic()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                            }
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding(10)
                }
                .padding(30)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("bluishGreen"))
                    VStack {
//                        Text("Add Name")
//                            .foregroundColor(Color.white)
                        TextField("name", text: $name)
                            .placeholder(when: name.isEmpty) {
                                Text("Name")
                                    .padding(10)
                                    .foregroundColor(Color("bluishGreen"))
                                    .background(.white)
                                    .italic()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .padding(10)
                }
                .padding(30)
                
                NavigationLink {
                    PolaroidDetailView(image: image!, name: name, socialHandle: socialHandle, doneSaving: $doneSaving)
                } label: {
                        
                        HStack {
                            Spacer()
                            Text("Add To Picture")
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                    }
                    .disabled(image == nil)
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .foregroundColor(.white)
//                    .background(Capsule().stroke(.yellow, lineWidth: 2))
                    .background(Capsule().fill(Color("Gamboge")))
                    .padding()
                }
//                .padding([.bottom])
            
                .onChange(of: doneSaving) { newValue in
                    guard newValue == true else { return }
                    dismiss()
                }
        }
        .preferredColorScheme(.dark)
        
    }
}

struct EnterNameSheet_Previews: PreviewProvider {
    @State private static var image: Image? = Image("UnfrozenMasto")
    
    static var previews: some View {
        EnterNameSheet(image: $image)
    }
}
