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
            
            HStack(alignment: .bottom, spacing: 10) {
                moreOptionsButton()
                imagePickerButton()
                messageTextField()
                sendMessageButton()
            }
            .padding(.leading, 8)
            .padding(.top, 10)
        }
        .frame(maxWidth: .infinity)
        
    }
    
    
    private func imagePickerButton() -> some View {
        Button {
        } label: {
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 27))
                .padding(.bottom, 4)
        }
    }
    
    private func moreOptionsButton() -> some View {
        Button {
        } label: {
            Image(systemName: "plus")
                .fontWeight(.black)
                .imageScale(.medium)
                .foregroundStyle(.white)
                .padding(8)
                .background(.blue)
                .clipShape(Circle())
                .padding(.leading, 3)
                .padding(.bottom, 3)
        }
    }
    
    private func messageTextField() -> some View {
        TextField("", text: $text, axis: .vertical)
            .padding(10)
            .foregroundColor(.black)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.white.opacity(0.7))
                    //                        .blur(radius: 10)
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        
    }
    
    private func sendMessageButton() -> some View {
        Button {
        } label: {
            Image(systemName: "arrow.up")
                .fontWeight(.black)
                .imageScale(.medium)
                .foregroundStyle(.white)
                .padding(8)
                .background(.blue)
                .clipShape(Circle())
                .padding(.trailing, 10)
                .padding(.bottom, 2)
        }
    }
}


#Preview {
    TextInputArea()
}







