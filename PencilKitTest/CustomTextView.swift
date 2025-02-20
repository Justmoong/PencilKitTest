//
//  CustomTextView.swift
//  PencilKitTest
//
//  Created by ymy on 2/20/25.
//

import SwiftUI
import UIKit

struct CustomTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var isHoldingPencil: Bool
    
    func makeUIView(context: Context) -> UITextField {
        let textView = UITextField()
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.isUserInteractionEnabled = !isHoldingPencil
        if #available(iOS 13.4, *) {
            for interaction in textView.interactions {
                if let scribbleInteraction = interaction as? UIScribbleInteraction {
                    textView.removeInteraction(scribbleInteraction)
                }
            }
        }
        return textView
    }
    func updateUIView(_ uiView: UITextField, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
        uiView.isUserInteractionEnabled = !isHoldingPencil
    }
    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(text: $text)
//    }
}
    
//    class Coordinator: NSObject, UITextViewDelegate {
//        var text: Binding<String>
//        init(text: Binding<String>) {
//            self.text = text
//        }
//        func textViewDidChange(_ textView: UITextView) {
//            text.wrappedValue = textView.text
//        }
//    }

