//
//  CustomBackButton.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 3/25/24.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Second View")
        }
                   .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                //                   VStack(spacing: 100) {
                //                       Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Retake")
                    }
                    .fontWeight(.bold)
                }
               
            }
            
//            ToolbarItem(placement: .navigationBarTrailing) {
//                //                   VStack(spacing: 100) {
//                //                       Spacer()
//                Button(action: {
////                    presentationMode.wrappedValue.dismiss()
//                    NavigationLink("CustomBackButton") {
//                        PolaroidMyInfoView()
//                    }
//                }) {
//                    HStack {
//                        Image(systemName: "chevron.left")
//                        Text("My Info")
//                    }
//                    .fontWeight(.bold)
//                }
//                
//            }
        }
        .navigationTitle("Capture Their Info")
        //           .navigationTitleDisplayMode(.inline) // Ensure the navigation title does not overlap with the toolbar items
    }
}

#Preview {
    CustomBackButton()
}
