//
//  SFSymbolStroke.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 2/27/24.
//

import SwiftUI

struct StrokeAroundSymbol: View {
    var symbolName: String
    var symbolSize: CGFloat
    var symbolColor: Color
    var strokeColor: Color
    var lineWidth: CGFloat
    
    var body: some View {
        ZStack {
            Image(systemName: "\(symbolName).fill")
                .font(.system(size: symbolSize))
                .foregroundColor(.green)
            Image(systemName: symbolName)
                .font(.system(size: symbolSize))
                .foregroundColor(symbolColor)
            

        }
    }
}

struct SFSymbolStroke: View {
    var body: some View {
        StrokeAroundSymbol(symbolName: "heart", symbolSize: 100, symbolColor: .black, strokeColor: .blue, lineWidth: 1)
    }
}

#Preview {
    SFSymbolStroke()
}
