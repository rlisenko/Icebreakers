//
//  SendMyPicView.swift
//  ConferenceBuddy
//
//  Created by Rob Lisenko on 3/15/23.
//

import SwiftUI

struct SendMyPicView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Placeholder for my pic, name and @Mastodon info")
                Text("Similar new photo and from library buttons?")
                Text("Resaves photo with my info and allows access to sharesheet")
            }
            .navigationTitle("Airdrop my contact info")
        }
        
    }
   
}

struct SendMyPicView_Previews: PreviewProvider {
    static var previews: some View {
        SendMyPicView()
    }
}
