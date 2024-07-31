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
            
            CustomTextEditor(text: $text)
                .frame(height: 100)
                .cornerRadius(10)
                
        }
        .padding(.horizontal)
    }
}

struct CustomTextEditor: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.3)
        textView.textColor = UIColor.white
        textView.tintColor = UIColor.white
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: CustomTextEditor
        
        init(_ parent: CustomTextEditor) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
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
