//
//  ContentView.swift
//  IceBreaker
//
//  Created by Rob Lisenko on 3/30/23.
//

import SwiftUI
//import UIKit

struct ContentView: View {
    @Environment(\.accessibilityShowButtonShapes)
    private var accessibilityShowButtonShapes
    
    @StateObject var viewModel = ViewModel()
    @StateObject var myInfo = ViewModel()
    
    @State private var tabselection = 0
    
    var body: some View {
        TabView(selection: $tabselection) {
            ExamplePeopleView()
                .tabItem {
                    Label {
                        Text("People")
                    } icon: {
                        Image("noun-photoalbum-2%")
                    }
                }
                .tag(1)
                .environmentObject(viewModel)
            
//            ExamplePizzaTimeView(tabselection: $tabselection)
            ExamplePizzaTimeView()
                .tabItem {
                    Label("Pizza Time", systemImage: "fork.knife")
                }
                .tag(2)
                .environmentObject(viewModel)
            
//            ExampleTrivia(tabselection: $tabselection)
            ExampleTrivia()
                .tabItem {
                    Label("Trivia", systemImage: "graduationcap")
                }
                .tag(3)
                .environmentObject(viewModel)
            
//            ListBuddyView()


        }
        .preferredColorScheme(.dark)
        .accentColor(.white)
//        .overlay(
//                GeometryReader { geo in
//                    let rect = geo.frame(in: .global)
//                    let width = rect.width / CGFloat(3)
//                    Rectangle()
//                        .frame(width: width, height: 60)
//                        .foregroundColor(.blue.opacity(0.40)) //enum of 5 colors
//                        .offset(x: CGFloat(tabselection) * width, y: (geo.frame(in: .local).maxY - 50))
//
//                }
//        )
//        .onAppear {
////            UITabBar.appearance().backgroundColor = UIColor(red: 100/255, green: 50/255, blue: 0/255, alpha: 1.0)
//            //read $tabselection to create a square over section?
//            UITabBar.appearance().backgroundColor = UIColor(Color("MutedBlue"))
//        }
//        .accentColor = UIColor(red: 226/255, green: 100/255, blue: 76/255, alpha: 1.0))
        
 

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
