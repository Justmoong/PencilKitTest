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
    
    var body: some View {
        ZStack {
            TextView()
                .disabled(isHoldingPencil)
            PencilLayerView(isHoldingPencil: $isHoldingPencil)
        }
    }
    
}

#Preview {
    ContentView()
}
