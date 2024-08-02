//
//  ChatView.swift
//  AnonymousChat
//
//  Created by Vishnesh Jayanthi Ramanathan on 23/07/24.
//

import SwiftUI

struct ChatView: View {
    let chat: Chat
    var blurMessages: Bool = false

    var body: some View {
        VStack {
            AsyncImage(url: chat.groupChatImage) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .padding()

            ScrollView {
                VStack {
                    if blurMessages {
                        ForEach(chat.messages.dropLast()) { message in
                            MessageView(message: message)
                                .blur(radius: 5)
                        }
                    } else {
                        ForEach(chat.messages) { message in
                            MessageView(message: message)
                        }
                    }
                    if let lastMessage = chat.messages.last {
                        MessageView(message: lastMessage)
                    }
                }
            }
            .padding()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
