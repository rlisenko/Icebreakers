//
//  IsYourAppActive.swift
//  Flashzilla
//
//  Created by Rob Lisenko on 3/13/23.
// Called "scene"Phase rather than appPhase because on iPad you could have an app running multiple times, e.g. split screen of Mail and composing a mail message

import SwiftUI

struct IsYourAppActive: View {
    @Environment(\.scenePhase) var scenePhase
    
    ///Test this in Simulator by dragging down Notification Center, or Shift-Cmd-H to get to Home screen
    var body: some View {
        Text("Shift-Cmd-H to see print statements!")
            .padding()
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active { //visible to the user
                    print("Active")
                } else if newPhase == .inactive { //active but Notification Center or something is visible
                    print("Inactive")
                } else if newPhase == .background { //not visible to the user, which on iOS means the app might be terminated at some point in the future.
                    print("Background")
                }
            }
    }
}

struct IsYourAppActive_Previews: PreviewProvider {
    static var previews: some View {
        IsYourAppActive()
    }
}
