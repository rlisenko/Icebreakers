//
//  ContentView.swift
//  ConferenceBuddy
//
//  Created by Rob Lisenko on 2/16/23.
//

import CoreImage
import SwiftUI
import Observation

struct ListBuddyView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var isShowingAddView = false
    
    var body: some View {
        NavigationView {
//            List {
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
            .navigationTitle("List of Buddies")
        }
    }
}
struct ListBuddyView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: ViewModel
    
    static var previews: some View {
        ListBuddyView()
    }
}
