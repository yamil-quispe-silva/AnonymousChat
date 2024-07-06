//
//  TextInputArea.swift
//  AnonymousChat
//
//  Created by Yamil on 7/4/24.
//

import SwiftUI

struct TextInputArea: View {
    @State private var text = ""
    
    var body: some View {
        
        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
            
            HStack(alignment: .bottom, spacing: 5) {
                imagePickerButton()
                    .padding(3)
                audioRecorderButton()
                messageTextField()
                sendMessageButton()
            }
            .padding(.bottom)
            .padding(.horizontal, 8)
            .padding(.top, 10)
            .background(Color(.clear))
        }
        
        
    }
    
    private func imagePickerButton() -> some View {
        Button {
        } label: {
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 22))  // Updated with font size
        }
    }
    
    private func audioRecorderButton() -> some View {
        Button {
        } label: {
            Image(systemName: "mic.fill")
                .fontWeight(.heavy)
                .imageScale(.small)
                .foregroundStyle(.white)
                .padding(6)
                .background(.blue)
                .clipShape(Circle())
                .padding(.horizontal, 3)
        }
    }
    
    private func messageTextField() -> some View {
        TextField("", text: $text, axis: .vertical)
            .padding(5)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.white.opacity(0.4))
                        .blur(radius: 0.5)
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 0) // Optional: to add a border
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        
        //        TextField("", text: $text, axis: .vertical)
//            .padding(5)
//            .background(
//                RoundedRectangle(cornerRadius: 20, style: .continuous)
//                    .fill(.ultraThinMaterial)
//            )
    }
    
    private func textViewBorder() -> some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(Color(.systemGray5), lineWidth: 1)
    }
    
    private func sendMessageButton() -> some View {
        Button {
        } label: {
            Image(systemName: "paperplane.fill")
        }
    }
}


#Preview {
    TextInputArea()
}
