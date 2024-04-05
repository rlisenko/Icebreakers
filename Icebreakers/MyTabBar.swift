//
//  MyTabBarButtonTest.swift
//  MyMengTo-iOS15
//
//  Created by Rob Lisenko on 2/22/24.
//

import SwiftUI

struct MyTabBar: View {
    @StateObject var viewModel = ViewModel()
    @State private var image: Image?
    
    @State var selectedTab: IceBreakersTab = .people
    @State var color: Color = .blue
    
    @Environment(\.dynamicTypeSize) var size
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Group {
                switch selectedTab {
                case .people:
                    PeopleView()
                        .environmentObject(viewModel)
                case .pizza:
                    TakePicView()
                        .environmentObject(viewModel)
                case .trivia:
                    TakePicView()
//                           AddPersonView(tabselection: $tabselection)
                        .environmentObject(viewModel)
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ///The custom Tab Bar, needs to abstracted into different Views for clarity
            HStack {
                ForEach(iceBreakersTabItems) { item in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            selectedTab = item.tab
                            color = item.color
                        }
                        
                    } label: {
                        ZStack {
                            //Tab's background and border
                            Rectangle()
                                .frame(width: size < .xxLarge ? 75 : 85, height: 75)
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .strokeBorder(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color("ButtonGradient"), .black.opacity(0.5)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 2
                                        )
                                )
                                .shadow(color: Color(red: 41/255, green: 39/255, blue: 130/255).opacity(0.35), radius: 3, x: 0, y: 3)
                            
                            VStack {
                                ///Button's SF Symbol Icon
                                Image(systemName: item.icon)
                                    .foregroundStyle(selectedTab == item.tab ? .white :  Color("TabIconColor"))
                                    .symbolVariant(selectedTab == item.tab ? .fill : .none)
                                    .font(.title)
                                    .dynamicTypeSize(...DynamicTypeSize.xxLarge)
                                    .shadow(color: .black.opacity(0.9), radius: 1)
                                    .frame(width: 50, height: 40)
                                ///Button's Label Text
                                Text(item.text)
                                    .foregroundStyle(selectedTab == item.tab ? .white : Color("TabTextColor"))
                                    .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                                    .font(.caption.bold())
                                    .shadow(color: .black.opacity(0.4), radius: 2)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(selectedTab == item.tab ? color :  Color("TabButtonBackground"))
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 4)
            ///This height should not be numeric, determin it through geometry reader
            .frame(height: 65, alignment: .top)
            .background(Color("TabBarBackground"))
//            .background(.ultraThinMaterial)
            //            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .shadow(color: .black.opacity(0.3), radius: 2)
//        .preferredColorScheme(.dark)
    }
}

#Preview {
    MyTabBar()
        .environmentObject(ViewModel())
}
