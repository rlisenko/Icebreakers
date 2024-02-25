//
//  MajidExample.swift
//  Icebreakers
//
//  Created by Rob Lisenko on 4/22/23.
//

import SwiftUI
import Charts

struct MyChartView: View {
    let numbers: [Double]
    
    var body: some View {
        Chart {
            ForEach(Array(numbers.enumerated()), id: \.offset) { index, value in
                LineMark(
                    x: .value("Index", index),
                    y: .value("Value", value)
                )
            }
        }
    }
}
struct MajidExample: View {
    @StateObject private var renderer = ImageRenderer(
            content: MyChartView(
                numbers: [1,2,3]
            )
        )
    
    var body: some View {
        if let image = renderer.uiImage {
                    Image(uiImage: image)
                }
        }
}

struct MajidExample_Previews: PreviewProvider {
    static var previews: some View {
        MajidExample()
    }
}
