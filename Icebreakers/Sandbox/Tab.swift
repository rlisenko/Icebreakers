//
//  Tab.swift
//  DesignCodeiOS15
//
//  Created by Meng To on 2021-11-05.
//

import SwiftUI

//struct TabItem: Identifiable {
//    var id = UUID()
//    var text: String
//    var icon: String
//    var tab: Tab
//    var color: Color
//}
//
//struct MyTabItem: Identifiable {
//    var id = UUID()
//    var text: String
//    var icon: String
//    var tab: MyTab
//    var color: Color
//}

struct IceBreakersTabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: IceBreakersTab
    var color: Color
}

//var tabItems = [
//    TabItem(text: "Learn Now", icon: "house", tab: .home, color: .teal),
//    TabItem(text: "Explore", icon: "magnifyingglass", tab: .explore, color: .blue),
//    TabItem(text: "Notifications", icon: "bell", tab: .notifications, color: .red),
//    TabItem(text: "Library", icon: "rectangle.stack", tab: .library, color: .brown)
//]
//
//var myTabItems = [
//    MyTabItem(text: "Tasks", icon: "scroll.fill", tab: .tasks, color: .green),
//    MyTabItem(text: "Care", icon: "stethoscope", tab: .care, color: .red),
//    MyTabItem(text: "Inventory", icon: "shippingbox.fill", tab: .inventory, color: .purple),
//    MyTabItem(text: "Ideas", icon: "house.fill", tab: .ideas, color: .yellow),
//    MyTabItem(text: "Help", icon: "magnifyingglass", tab: .help, color: .gray)
//]

var iceBreakersTabItems = [
//    IceBreakersTabItem(text: "People", icon: "noun-photoalbum-2%", tab: .people, color: Color("ClearBlue")),
    IceBreakersTabItem(text: "People", icon: "photo.stack", tab: .people, color: Color("ClearBlue")),
    IceBreakersTabItem(text: "Pizza Time", icon: "fork.knife", tab: .pizza, color: Color("Gamboge")),
    IceBreakersTabItem(text: "Trivia", icon: "graduationcap", tab: .trivia, color: Color("bluishGreen"))
]

//enum Tab: String {
//    case home
//    case explore
//    case notifications
//    case library
//}
//
//enum MyTab: String {
//    case tasks
//    case care
//    case inventory
//    case ideas
//    case help
//}

enum IceBreakersTab: String {
    case people
    case pizza
    case trivia
}


struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
