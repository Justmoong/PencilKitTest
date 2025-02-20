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
        if let touch = touches.first {
            if touch.type == .pencil {
                DispatchQueue.main.async {
                    self.onPencilTouch?(true) // Apple Pencil 사용 감지
                }
            } else {
                DispatchQueue.main.async {
                    self.onPencilTouch?(false) // 손가락 입력 감지
                }
            }
        }
        super.touchesBegan(touches, with: event) // 이벤트 전파
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.type == .pencil {
                DispatchQueue.main.async {
                    self.onPencilTouch?(true) // Apple Pencil 지속 감지
                }
            }
        }
        super.touchesMoved(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.type != .pencil {
            DispatchQueue.main.async {
                self.onPencilTouch?(false) // 손가락 사용 시 텍스트 입력 모드 유지
            }
        }
        super.touchesEnded(touches, with: event)
    }
}
