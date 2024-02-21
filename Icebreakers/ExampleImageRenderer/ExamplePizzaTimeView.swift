//
//  ExamplePizzaTimeView.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 2/21/24.
//

import CoreImage
import SwiftUI
import Observation

struct ExamplePizzaTimeView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var isShowingAddView = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                GeometryReader { reader in
                    Color("Gamboge")
                        .frame(height: reader.safeAreaInsets.top * 1.1, alignment: .top)
                        .ignoresSafeArea()
                }
                VStack {
                    Spacer(minLength: 20)
                    Button(action: {
                        // action to perform on tap
                    }) {
                        ZStack {
                            Image(systemName: "camera.shutter.button")
                                .symbolRenderingMode(.multicolor)
                                .foregroundStyle(.white)
                                .font(.system(size: 28))
                                .fontWeight(.bold)
                                .offset(y: -2)
                            Circle()
                                .strokeBorder(Color("Gamboge"), lineWidth: 11)
                                .shadow(radius: 10)
                                .frame(width: 74, height: 74)
                                .overlay(
                                    Circle()
                                        .stroke(Color(red: 0, green: 0.34, blue: 0.63), lineWidth: 1)
                                        .frame(width: 74, height: 74)
                                )
                        }
                    }
                    
                    
                    //                .frame(width: 47, height: 39, alignment: .center)
                    
                    Text("Indie Dev Day 1") //this needs to reference a date field in model that could be sorted somehow
                        .foregroundStyle(.gray)
                    ScrollView {
                        
                        ForEach(viewModel.people) { person in
                            NavigationLink {
                                person.image?
                                    .resizable()
                                    .scaledToFit()
                                
                                if let image = person.image {
                                    ShareLink(item: image, preview: SharePreview(person.name, image: image)) {
                                        HStack {
                                            Spacer()
                                            Image(systemName: "square.and.arrow.up")
                                            Text("Airdrop to buddy")
                                            Spacer()
                                        }
                                        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                                    }
                                    .font(.system(.title2, design: .rounded, weight: .bold))
                                    .foregroundColor(.white)
                                    .background(Capsule().fill(Color("ClearBlue")))
                                    .padding(30)
                                }
                            } label: {
                                person.image?
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .onDelete(perform: viewModel.removePerson)
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Pizza Time 🍕").font(.largeTitle)
                            
                        }
                        ToolbarItem {
                            Button(action: {
//Preferences sheet
                            }, label: {
                                Label("Settings", systemImage: "gearshape")
                            })
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    ExamplePizzaTimeView()
//}
