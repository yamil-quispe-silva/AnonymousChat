//
//  ChatRoomView.swift
//  AnonymousChat
//
//  Created by Yamil on 7/4/24.
//

import SwiftUI

struct ChatRoomView: View {
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVStack {
                    ForEach(0..<12) { _ in
                        Text("PLACEHOLDER")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .background(Color.gray.opacity(0.1))
                    }
                }
            }
            .toolbar {
                leadingNavItems()
                trailingNavItems()
            }
            .safeAreaInset(edge: .bottom) {
                TextInputArea()
            }
        }
        
        
    }
}

extension ChatRoomView {
    @ToolbarContentBuilder
    private func leadingNavItems() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            HStack {
                Circle()
                    .frame(width: 35, height: 30)
                Text("QaUser12")
                    .bold()
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItems() -> some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button {
            } label: {
                Image(systemName: "video")
            }
            Button {
            } label: {
                Image(systemName: "phone")
            }
        }
    }
}


#Preview {
    NavigationStack {
        ChatRoomView()
    }
    
}
