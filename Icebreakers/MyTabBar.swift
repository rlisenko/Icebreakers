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
                                .frame(width: 75, height: 75)
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .strokeBorder(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color("Lavender").opacity(0.6), .black.opacity(0.5)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 2
                                        )
                                )
                                .shadow(color: Color(red: 41/255, green: 39/255, blue: 130/255).opacity(0.35), radius: 3, x: 0, y: 3)
                            // Symbol and label
                            VStack(spacing: 5) {
                                ZStack {
                                    Image(systemName: item.icon)
                                        .foregroundStyle(selectedTab == item.tab ? .white : Color("Lavender").opacity(0.8))
                                        .symbolVariant(.fill)
                                        .font(.largeTitle)
                                        .shadow(color: .black.opacity(0.6), radius: 2)
                                    .frame(width: 50, height: 40)
                                }
                                
                                Text(item.text)
                                    .foregroundStyle(selectedTab == item.tab ? .white : Color("Lavender").opacity(0.6))
                                    .font(.caption.bold())
                                    .lineLimit(2)
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(selectedTab == item.tab ? color : .white.opacity(0.3))
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .padding(.bottom, 25)
            .frame(height: 110, alignment: .top)
            .background(.thickMaterial)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MyTabBar()
        .environmentObject(ViewModel())
}
