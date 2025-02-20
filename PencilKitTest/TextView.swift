//
//  TextView.swift
//  PencilKitTest
//
//  Created by ymy on 2/20/25.
//

import SwiftUI

struct TextView: View {
    
    @State private var text = ""
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .padding(.horizontal, 24)
    }
}

#Preview {
    TextView()
}
