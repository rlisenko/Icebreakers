//
//  PersonDetailView.swift
//  ConferenceBuddy
//
//  Created by Rob Lisenko on 3/8/23.
//

import SwiftUI

struct PolaroidDetailView: View {
    @EnvironmentObject var viewModel: ViewModel

    let image: Image
    let name: String
    let socialHandle: String
    
    @Binding var doneSaving: Bool
    
    @Environment(\.displayScale) private var scale
    
    var body: some View {
        NavigationView {
            VStack {
                PolaroidContent
                Button {
                    let renderer = ImageRenderer(content: PolaroidContent)
                    renderer.scale = scale
                    guard let uiImage = renderer.uiImage else { return }
                    save(uiImage)
                    doneSaving = true
                } label: {
                    HStack {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                }
                .font(.system(.title2, design: .rounded, weight: .bold))
                .foregroundColor(.white)
                .background(Capsule().fill(Color("Gamboge")))
                .padding(30)
            }
        }
    }
    
    private var PolaroidContent: some View {
        ZStack {
            Image("polaroidstockphoto")
            image
                .resizable()
                .scaledToFit()
                .frame(width: 305, height: 305)
                .padding(.bottom, 60)
            Text(name)
                .padding(.top, 300.0)
                .font(.custom("PermanentMarker-Regular", size: 28))
                .foregroundColor(Color.black)
            Text(socialHandle)
                .foregroundColor(Color.blue)
                .padding(.top, 360.0)
     
        }
        .border(Color.gray, width: 2)
        .shadow(radius: 5.0)
        .preferredColorScheme(.dark)
    }
    
    func save(_ uiImage: UIImage) {
        guard let jpegData = uiImage.jpegData(compressionQuality: 0.8) else { return }
    
        let person = Person.init(name: name, mastodonUser: socialHandle, jpegData: jpegData)
        viewModel.addPerson(person)
    }
}


struct PolaroidDetailView_Previews: PreviewProvider {
    static var image = Image("UnfrozenMasto")
    static var name = "Thawing Masto Test"
    static var socialHandle = "@mockUser@mastodon.social"
    @State static var doneSaving = false
    
    static var previews: some View {
        PolaroidDetailView(image: image, name: name, socialHandle: socialHandle, doneSaving: $doneSaving)
    }
}
