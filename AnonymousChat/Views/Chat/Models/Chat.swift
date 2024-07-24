//
//  Chat.swift
//  AnonymousChat
//
//  Created by Vishnesh Jayanthi Ramanathan
//

import Foundation

struct Chat: Identifiable {
    let id: UUID
    let participants: [User]
    var messages: [Message]
    let friend: UUID
    let imageURL: URL
    let chatName: String
}

struct User: Identifiable {
    let id: UUID
    let name: String
}

struct Message: Identifiable {
    let id: UUID
    let sender: User
    let content: String
    let timestamp: Date
}
