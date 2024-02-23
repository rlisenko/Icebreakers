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
                case .pizza:
                    ExamplePizzaTimeView()
                case .trivia:
                    ExampleTrivia()
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
                         
                            VStack(spacing: 5) {
                                Image(systemName: item.icon)
                                    .symbolVariant(.fill)
                                    .font(.largeTitle)
                                    .frame(width: 50, height: 40)
                                Text(item.text)
                                    .font(.caption.bold())
                                    .lineLimit(2)
                            }
                            Rectangle()
                                .stroke(.gray, lineWidth: 2)
                                .frame(width: 70)
                                .cornerRadius(7)
                            
//                                .background(.ultraThinMaterial).opacity(0.5)
//                                .strokeBorder(style: <#T##SwiftUI.StrokeStyle#>)
                                
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(selectedTab == item.tab ? color : .gray)
//                    .blendMode(selectedTab == item.tab ? .overlay : .normal)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            
//            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
//            .strokeStyle(cornerRadius: 34)
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
