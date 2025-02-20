//
//  ContentView.swift
//  PencilKitTest
//
//  Created by ymy on 2/20/25.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    
    @State private var isHoldingPencil: Bool = false
    @State private var canvasView = PKCanvasView()
    @State private var text = ""
    
    var body: some View {
        ZStack {
            CustomTextView(text: $text, isHoldingPencil: $isHoldingPencil)
                .disabled(isHoldingPencil)
                .opacity(isHoldingPencil ? 0.5 : 1.0)
            PencilLayerView(isHoldingPencil: $isHoldingPencil)
                .allowsTightening(true)
        }
    }
    
}

#Preview {
    ContentView()
}
