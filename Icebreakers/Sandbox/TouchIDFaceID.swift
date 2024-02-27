//
//  TouchIDFaceID.swift
//  Bucket List
//
//  Created by Rob Lisenko on 1/30/23.
// must change Project to add row in Info
// don't only use these, let users have a password too

import LocalAuthentication
import SwiftUI

struct TouchIDFaceID: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
//                Text("Unlocked 🔓")
//                    .font(.largeTitle)
                
//                Button("Get goin'") {
                ExamplePeopleView(isCameraShowing: false)
//                }
            } else {
                Text("Locked 🔒")
                    .font(.largeTitle)
            }
        }
        .onAppear(perform: authenticate)
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct TouchIDFaceID_Previews: PreviewProvider {
    static var previews: some View {
        TouchIDFaceID()
    }
}
