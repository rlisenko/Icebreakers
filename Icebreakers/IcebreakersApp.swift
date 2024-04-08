//
//  IcebreakersApp.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 4/14/23.
//

import SwiftUI

@main
struct IcebreakersApp: App {
    @State private static var image: Image? = Image("UnfrozenMasto")
    
    var body: some Scene {
        WindowGroup {
//            ContentView()   
            MyTabBar()
//            TakePicView()
//            EnterNameView(image: $image)
//            CameraView()
        }
    }
}
