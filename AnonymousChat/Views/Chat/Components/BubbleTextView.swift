//
//  BubbleTextView.swift
//  AnonymousChat
//
//  Created by Yamil on 7/9/24.
//

import SwiftUI

struct BubbleTextView: View {
    let item: MessageItem
    var body: some View {
        VStack(alignment:item.horizontalAlignment, spacing: 3) {
            Text("Hello, World! How are you?")
                .padding(10)
                .font(.custom("Swiss 721 Bold Rounded", size: 16))
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(item.backgroundColor)
                )
                .foregroundColor(item.textColor)
            
            timeStampTextView()
        }
        .shadow(color: Color(.systemGray3).opacity(0.1), radius: 5, x: 0, y: 20)
        .frame(maxWidth: .infinity, alignment: item.alignment)
        .padding(.leading, item.direction == .received ? 5 : 100)
        .padding(.trailing, item.direction == .received ? 100 : 5)
    }
    
    private func timeStampTextView() -> some View {
        HStack {
            Text("3:05 PM")
                .font(.custom("Swiss 721 Bold Rounded", size: 12))
                .foregroundStyle(.white)
                .fontWeight(.medium)
                .padding(.horizontal, 6)
        }
    }
    
}




#Preview {
    ScrollView {
        BubbleTextView(item: .sentPlaceholder)
        BubbleTextView(item: .receivedPlaceholder)
    }
    .frame(maxWidth: .infinity)
    .background(.black.opacity(0.5))
    
}
