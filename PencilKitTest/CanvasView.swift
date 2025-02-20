//
//  CanvasView.swift
//  PencilKitTest
//
//  Created by ymy on 2/20/25.
//

import SwiftUI
import PencilKit

struct PencilLayerView: UIViewRepresentable {
    @Binding var isHoldingPencil: Bool

    func makeUIView(context: Context) -> CustomCanvasView {
        let canvasView = CustomCanvasView()
        canvasView.drawingPolicy = .pencilOnly
        canvasView.backgroundColor = UIColor.clear
        //disble Apple pencil scribble
        
        // Apple Pencil 감지 핸들러 추가
        canvasView.onPencilTouch = { isPencil in
            DispatchQueue.main.async {
                self.isHoldingPencil = isPencil
            }
        }
        
        return canvasView
    }

    func updateUIView(_ uiView: CustomCanvasView, context: Context) {
        uiView.isUserInteractionEnabled = isHoldingPencil
    }
}
