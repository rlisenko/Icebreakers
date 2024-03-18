//
//  Tab.swift
//

import SwiftUI

struct IceBreakersTabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: IceBreakersTab
    var color: Color
}

var iceBreakersTabItems = [
//    IceBreakersTabItem(text: "People", icon: "noun-photoalbum-2%", tab: .people, color: Color("ClearBlue")),
    IceBreakersTabItem(text: "People", icon: "photo.stack.fill", tab: .people, color: Color("ClearBlue")),
    IceBreakersTabItem(text: "Take Pic", icon: "camera.shutter.button.fill", tab: .pizza, color: Color("Gamboge")),
    IceBreakersTabItem(text: "Settings", icon: "gearshape.fill", tab: .trivia, color: Color("bluishGreen"))
]

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
