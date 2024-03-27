//
//  MoreCustomNavBars.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 3/25/24.
//

import SwiftUI

struct MoreCustomNavBars: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isThirdViewActive = false // State variable to control navigation to third view
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { reader in
                Color("bluishGreen")
                    .frame(height: reader.safeAreaInsets.top * 1.1, alignment: .top)
                    .ignoresSafeArea()
            }
            VStack {
                Spacer()
                Text("More Viewing")
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ThirdView()) {
                        HStack {
                            Image(systemName: "arrow.up.circle")
                            Text("My Info")
                        }
                        .fontWeight(.semibold)
                    }
                }
            }
            .navigationTitle("Second View")
            .tint(.white)
        }
        //           .navigationTitleDisplayMode(.inline)
    }
}

#Preview {
    MoreCustomNavBars()
}
