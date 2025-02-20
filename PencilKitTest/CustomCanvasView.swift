//
//  CustomCanvasView.swift
//  PencilKitTest
//
//  Created by ymy on 2/20/25.
//

import PencilKit
import UIKit

class CustomCanvasView: PKCanvasView {
    var onPencilTouch: ((Bool) -> Void)?

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if let touch = touches.first {
            if touch.type == .pencil {
                onPencilTouch?(true) // Apple Pencil 사용 감지
            } else {
                onPencilTouch?(false) // 손가락 입력 감지
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        if let touch = touches.first {
            if touch.type == .pencil {
                onPencilTouch?(true)
            } else {
                onPencilTouch?(false)
            }
        }
    }
}
