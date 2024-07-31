//
//  Chat.swift
//  AnonymousChat
//
//  Created by Yamil on 7/29/24.
//

import Foundation

struct Chat: Identifiable {
    var id: String
    var chatName: String?
//    var lastMessage: [Message]
    var creationDate: Date
    var lastMessageTimeStamp: Date
    var membersCount: UInt
    var adminUids: [String]
    var membersUids: [String]
//    var members: [User]
    var groupChatImage: String?
    var groupChatDescription: String
    var createdBy: String

    var isGroupChat: Bool {
        return membersCount > 2
    }

    static var placeholder = Chat(
        id: "1",
//        lastMessage: "Hello world",
        creationDate: Date(),
        lastMessageTimeStamp: Date(),
        membersCount: 2,
        adminUids: [],
        membersUids: [],
//        members: [],
        groupChatDescription: "hola",
        createdBy: "carlos"
    )
}


extension Chat {
    init(_ dict: [String: Any]) {
        self.id = dict["_id"] as? String ?? ""
        self.chatName = dict["name"] as? String ?? nil
//        self.lastMessage = (dict["lastMessage"] as? [[String: Any]] ?? []).compactMap { Message($0) }
        let creationInterval = dict["creationDate"] as? Double ?? 0
        self.creationDate = Date(timeIntervalSince1970: creationInterval)
        let lastMsgTimeStampInterval = dict["lastMessageTimeStamp"] as? Double ?? 0
        self.lastMessageTimeStamp = Date(timeIntervalSince1970: lastMsgTimeStampInterval)
        self.membersCount = dict["membersCount"] as? UInt ?? 0
        self.adminUids = dict["adminUids"] as? [String] ?? []
        self.membersUids = dict["membersUids"] as? [String] ?? []
//        self.members = (dict["members"] as? [[String: Any]] ?? []).compactMap { User($0) }
        self.groupChatImage = dict["thumbnailUrl"] as? String ?? nil
        self.groupChatDescription = dict["groupChatDescription"] as? String ?? ""
        self.createdBy = dict["createdBy"] as? String ?? ""
    }
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
