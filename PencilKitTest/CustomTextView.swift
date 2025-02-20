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
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.delegate = context.coordinator
        if #available(iOS 13.4, *) {
            for interaction in textView.interactions {
                if let scribbleInteraction = interaction as? UIScribbleInteraction {
                    textView.removeInteraction(scribbleInteraction)
                }
            }
        }
        return textView
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
        init(text: Binding<String>) {
            self.text = text
        }
        func textViewDidChange(_ textView: UITextView) {
            text.wrappedValue = textView.text
        }
    }
}
