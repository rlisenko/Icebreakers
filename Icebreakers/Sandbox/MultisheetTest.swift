//
//  MultisheetTest.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 4/25/23.
//

import SwiftUI

struct MultisheetTest: View {
    @State private var showingFirst = false
       @State private var showingSecond = false

       var body: some View {
           VStack {
               Button("Show First Sheet") {
                   showingFirst = true
               }
           }
           .sheet(isPresented: $showingFirst) {
               Button("Show Second Sheet") {
                   showingSecond = true
               }
               .sheet(isPresented: $showingSecond) {
                   Text("Second Sheet")
               }
           }
       }
}

struct MultisheetTest_Previews: PreviewProvider {
    static var previews: some View {
        MultisheetTest()
    }
}
