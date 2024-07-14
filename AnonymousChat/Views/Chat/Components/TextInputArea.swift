//
//  TextInputArea.swift
//  AnonymousChat
//
//  Created by Yamil on 7/4/24.
//

import SwiftUI

struct TextInputArea: View {
    @State private var text: String = ""

    var body: some View {
        
        ZStack {
            HStack(alignment: .bottom, spacing: 4) {
                moreOptionsButton()
                imagePickerButton()
                messageTextField()
            }
            .padding(.leading, 5)
            .padding(.trailing, 5)
            .padding(.top, 6)
            .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity)
        .background(Color.clear)
        
        
    }
    
    
    
    
    private func moreOptionsButton() -> some View {
        Button {
        } label: {
            Image(systemName: "plus")
                .fontWeight(.bold)
                .imageScale(.medium)
                .foregroundStyle(.white)
                .padding(8)
                .background(.blue)
                .clipShape(Circle())
                .padding(.bottom, 10)
        }
    }
    
    private func imagePickerButton() -> some View {
        Button {
        } label: {
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 27))
                .padding(.bottom, 10)
        }
    }
    
    private func messageTextField() -> some View {
        
        HStack(alignment: .bottom, spacing: 8) {
            // TextField
            TextField("Type a message", text: $text, axis: .vertical)
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.clear)
                )
                .font(.custom("Swiss 721 Bold Rounded", size: 17)) // Adjust font and size
                .foregroundColor(.black )
                .lineLimit(nil)


            
            Button(action: {
                // Send button action
            }) {
                Image(systemName: "arrow.up")
                    .fontWeight(.bold)
                    .imageScale(.medium)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(.blue)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 7)
        .background(Color(.systemGray2))
        .cornerRadius(30)
        
        
    }
}


#Preview {
    TextInputArea()
}







