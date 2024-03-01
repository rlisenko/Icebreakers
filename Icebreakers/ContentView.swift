//
//  ContentView.swift
//  IceBreaker
//
//  Created by Rob Lisenko on 3/30/23.
//

import SwiftUI
//import UIKit

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    @State private var tabselection = 0
    
    var body: some View {
        TabView(selection: $tabselection) {
            ExamplePeopleView()
//            TouchIDFaceID()
                .tabItem {
                    Label {
                        Text("People")
                    } icon: {
                        Image("noun-photoalbum-2%")
                    }
                }
                .tag(1)
                .environmentObject(viewModel)
            
            AddPersonView(tabselection: $tabselection)
//            ExamplePizzaTimeView()
                .tabItem {
                    Label("Add Person", systemImage: "person.fill.badge.plus")
                }
                .tag(2)
                .environmentObject(viewModel)
            
//            ExampleTrivia(tabselection: $tabselection)
            ExampleTrivia()
                .tabItem {
                    Label("TBD", systemImage: "graduationcap")
                }
                .tag(3)
                .environmentObject(viewModel)
            
//            ListBuddyView()


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
