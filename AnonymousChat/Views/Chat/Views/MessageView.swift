//
//  MessageView.swift
//  AnonymousChat
//
//  Created by Vishnesh Jayanthi Ramanathan
//

import SwiftUI

struct MessageView: View {
    let message: Message

    var body: some View {
        HStack {
            if message.sender.id == UUID() { // Replace UUID() with current user ID check
                Spacer()
                Text(message.content)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .foregroundColor(.black)
            } else {
                Text(message.content)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
