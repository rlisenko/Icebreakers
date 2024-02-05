//
//  ContentView.swift
//  IceBreaker
//
//  Created by Rob Lisenko on 3/30/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @Environment(\.accessibilityShowButtonShapes)
    private var accessibilityShowButtonShapes
    
    @StateObject var viewModel = ViewModel()
    @StateObject var myInfo = ViewModel()
    
    @State private var tabselection = 0
    
    var body: some View {
        TabView(selection: $tabselection) {
            AddPersonView(tabselection: $tabselection)
                .tabItem {
                        Label {
                            Text("Get Buddy Info")
                        } icon: {
                            Image("noun-polaroid-3")
                        }
                }
                .tag(0)
                .environmentObject(viewModel)
            
            AddPersonView(tabselection: $tabselection)
                .tabItem {
                    Label("Send My Info", systemImage: "square.and.arrow.up")
                }
                .tag(1)
                .environmentObject(viewModel)
            
            ListBuddyView()
                .tabItem {
                    Label {
                        Text("List of Buddies")
                    } icon: {
                        Image("noun-photoalbum-2%")
                    }
                }
                .tag(2)
                .environmentObject(viewModel)
            
        }
        .preferredColorScheme(.dark)
        .accentColor(.white)
    }
}

extension UITabBarController {
    override open func viewDidLoad() {
        let standardAppearance = UITabBarAppearance()

        standardAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        standardAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        tabBar.standardAppearance = standardAppearance
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
