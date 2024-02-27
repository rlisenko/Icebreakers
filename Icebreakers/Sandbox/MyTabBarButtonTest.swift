//
//  MyTabBarButtonTest.swift
//  MyMengTo-iOS15
//
//  Created by Rob Lisenko on 2/22/24.
//

import SwiftUI

struct MyTabBarButtonTest: View {
    @StateObject var viewModel = ViewModel()
    @State var selectedTab: IceBreakersTab = .people
    @State var color: Color = .blue
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Group {
                switch selectedTab {
                case .people:
                    ExamplePeopleView()
                        .environmentObject(viewModel)
                case .pizza:
                    ExamplePizzaTimeView()
                        .environmentObject(viewModel)
                case .trivia:
                    ExampleTrivia()
                        .environmentObject(viewModel)
                }
            }

            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                ForEach(iceBreakersTabItems) { item in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            selectedTab = item.tab
                            color = item.color
                        }
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                   .fill(Color.clear)
                                   .background(
                                       Color.blue.opacity(0.4)
                                           .blur(radius: 20) // Adjust the blur radius as needed
                                   )
//                                   .edgesIgnoringSafeArea(.all)  Extend the blur to cover the entire view
                            Rectangle()
                                .frame(width: 75, height: 90)
                                .cornerRadius(7)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 7)
                                            .strokeBorder(Color("Lavender").opacity(0.6), lineWidth: 1)
                                )
                                .shadow(color: Color(red: 41/255, green: 39/255, blue: 130/255).opacity(0.35), radius: 3, x: 0, y: -10)
                            VStack(spacing: 5) {
                                Image(systemName: item.icon)
                                    .foregroundStyle(selectedTab == item.tab ? .white : Color("Lavender").opacity(0.6))
                                    .symbolVariant(.fill)
                                    .font(.largeTitle)
                                    .frame(width: 50, height: 40)
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
            .padding(.bottom, 15)
            .frame(height: 110, alignment: .top)
            
//            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
//            .strokeStyle(cornerRadius: 34)
            .background(.thickMaterial)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MyTabBarButtonTest()
        .environmentObject(ViewModel())
}
