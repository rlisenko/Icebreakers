//
//  MajidDynamicRendering.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 4/22/23.
//

import SwiftUI

struct MajidDynamicRendering: View {
    @State private var image: UIImage?
    @State private var processedImage: UIImage?
    @State private var inputImage: UIImage?
    
    @State private var showingImagePicker = false
    
    
       @State private var shareSheetShown = false
       @Environment(\.displayScale) private var scale
    @Environment(\.dismiss) var dismiss
       
    var body: some View {
        NavigationView{
//            List {
//                summarySection
//            }
//            .toolbar {
//                Button("Start Breaking") {
//                    let renderer = ImageRenderer(content: summarySection)
//                    renderer.scale = scale
//                    image = renderer.uiImage
////                    shareSheetShown = true
//                    save()
//                }
//            }
//            .sheet(isPresented: $shareSheetShown) {
                VStack {
                    summarySection
                    Button {
                        let renderer = ImageRenderer(content: summarySection)
                        renderer.scale = scale
                        image = renderer.uiImage
    //                    shareSheetShown = true
                        save()
    
                    } label: {
                        HStack {
                            Spacer()
                            Text("Break The Ice")
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                    }
//                    .disabled(inputImage == nil) //bailout if there is no current inputImage
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .foregroundColor(.yellow)
                    .background(Capsule().stroke(.yellow, lineWidth: 2))
    //                    .disabled(!hasImageAndName)
                    .padding()
                }
//            }
        }
    }
       
       private var summarySection: some View {
           VStack {
               // ...
               Image("JohnMastodon")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 285, height: 285)
               Text("@JohnMastodon@mastodon.social")
                   .fontWeight(.bold)
               
               Text("John Mastodon")
                   .fontWeight(.bold)
           }
           .frame(width: 300, height: 375)
           
       }
    func save() {
        guard let processedImage = image else { return }
//        guard let renderImage = renderer else { return }
        
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = {
            print("Success!")
        }

        imageSaver.errorHandler = {
            print("Oops: \($0.localizedDescription)")
        }
        
        imageSaver.writeToPhotoAlbum(image: processedImage)
        dismiss()
    }
}

struct MajidDynamicRendering_Previews: PreviewProvider {
    static var previews: some View {
        MajidDynamicRendering()
    }
}
