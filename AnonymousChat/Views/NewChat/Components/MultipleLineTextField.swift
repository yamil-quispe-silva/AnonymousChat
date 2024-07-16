//
//  MultipleLineTextField.swift
//  AnonymousChat
//
//  Created by Yamil on 7/16/24.
//

import SwiftUI

struct MultipleLineTextField: View {
    let placeholder: String
    @Binding var text: String 
    let internalPadding: CGFloat = 5
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color.white.opacity(0.3))
                    .padding(EdgeInsets(top: 7, leading: 7, bottom: 0, trailing: 0))
                    .font(.subheadline)
                
            }
            
            TextEditor(text: $text)
                .frame(height: 100)
                .colorMultiply(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .accentColor(.white)
            
        }
        .padding(.horizontal)
    }
}


struct MultipleLineTextField_Previews: PreviewProvider {
    
    struct PreviewWrapper: View {
        @State private var previewText = ""

        var body: some View {
            MultipleLineTextField(placeholder: "type", text: $previewText)
        }
    }
    
    static var previews: some View {
        PreviewWrapper()
    }
}
