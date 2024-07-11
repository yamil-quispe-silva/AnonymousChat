//
//  BubbleImageView.swift
//  AnonymousChat
//
//  Created by Yamil on 7/10/24.
//

import SwiftUI

struct BubbleImageView: View {
    let item: MessageItem

    var body: some View {
        HStack {
            if item.direction == .sent { Spacer() }
            
            
            messageTextView()
                .shadow(color: Color(.systemGray3).opacity(0.1), radius: 5, x: 0, y: 20)

            if item.direction == .received { Spacer() }
            
        }
        
    }

    private func messageTextView() -> some View {
        VStack(alignment: .leading, spacing: 7) {
            Image("messageImage2")
                .resizable()
                .scaledToFill()
                .frame(width: 310, height: 280)
                .clipShape(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                .overlay (alignment: .topTrailing) {
                    shareButton()
                        .padding(7)
                }
                .padding(5)
            
            
            
            Text(item.text)
                .font(.custom("Swiss 721 Bold Rounded", size: 16))
                .padding(.trailing, 10)
                .padding(.leading, 13)
                .padding(.bottom, 11)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(width: 320)
                .foregroundColor(item.textColor)
                
        }
        .background(item.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }

    private func shareButton() -> some View {
        Button {
            
        } label: {
            Image(systemName: "arrowshape.turn.up.right.fill")
                .padding(10)
                .foregroundStyle(item.textColor.opacity(0.8))
                .background(item.backgroundColor.opacity(0.7))
                .background(.thinMaterial)
                .clipShape(Circle())
        }
    }
}


#Preview {
    ScrollView {
        BubbleImageView(item: .receivedPlaceholder)
        BubbleImageView(item: .sentPlaceholder)
    }
    .frame(maxWidth: .infinity)
    .padding(.horizontal)
    .background(.black.opacity(0.5))
    
    
}
