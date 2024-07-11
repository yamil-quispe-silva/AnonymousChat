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
//                sendMessageButton()
            }
            .padding(.leading, 5)
            .padding(.trailing, 5)
            .padding(.top, 0)
            .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity)
        
    }
    
    private func moreOptionsButton() -> some View {
        Button {
        } label: {
            Image(systemName: "plus")
                .fontWeight(.bold)
                .imageScale(.medium)
                .foregroundStyle(.white)
                .padding(7)
                .background(.blue)
                .clipShape(Circle())
//                .padding(.leading, 3)
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
                .foregroundColor(.white )
                .lineLimit(nil) // Allow for multiple lines
//                .padding(.trailing, 1) // Add padding to ensure text does not overlap button

            // Send Button
            Button(action: {
                // Send button action
            }) {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.blue)
                    .background(
                        Circle()
                            .fill(Color(.white))
                    )
            }
//            .padding(.bottom, 2) // Align the button at the bottom
//            .padding(.trailing, 3)
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 7)
        .background(Color(.systemGray4).opacity(0.9)) // Background color of the TextField view
        .cornerRadius(30)
        
        
        
        
        
        
        
        
        
        
        
        
//        TextField("", text: $text, axis: .vertical)
//            .padding(10)
//            .foregroundColor(.black)
//            .font(.custom("Swiss 721 Bold Rounded", size: 16))
//            .background(
//                ZStack {
//                    RoundedRectangle(cornerRadius: 20, style: .continuous)
//                        .fill(Color.white.opacity(0.7))
//                    //                        .blur(radius: 10)
//                }
//            )
//            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        
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







