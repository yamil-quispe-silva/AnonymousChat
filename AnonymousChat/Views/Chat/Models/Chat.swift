
//
//  Chat.swift
//  AnonymousChat
//
//  Created by Yamil on 7/29/24.
//

import Foundation
import UIKit

struct Chat: Identifiable {
    var id: String
    var chatName: String?
    //    var lastMessage: [Message]
    var messages: [Message]
    var creationDate: Date
    var lastMessageTimeStamp: Date
    var membersCount: UInt
    var adminUids: [String]
    var membersUids: [String]
    var members: [User]
    var groupChatImage: URL
    var groupChatDescription: String
    var createdBy: String
    var friend: String
    var isGroupChat: Bool {
        return membersCount > 2
    }
    
    
    //    static var placeholder = Chat(
    //        id: "1",
    ////        lastMessage: "Hello world",
    //        creationDate: Date(),
    //        var messages: [Message()]
    //        lastMessageTimeStamp: Date(),
    //        membersCount: 2,
    //        adminUids: [],
    //        membersUids: [],
    ////        members: [],
    //        groupChatDescription: "hola",
    //        createdBy: "carlos"
    //    )
}

extension Chat {
    init(_ dict: [String: Any]) {
        self.id = dict["_id"] as? String ?? ""
        self.chatName = dict["name"] as? String ?? nil
        let creationInterval = dict["creationDate"] as? Double ?? 0
        self.creationDate = Date(timeIntervalSince1970: creationInterval)
        let lastMsgTimeStampInterval = dict["lastMessageTimeStamp"] as? Double ?? 0
        self.lastMessageTimeStamp = Date(timeIntervalSince1970: lastMsgTimeStampInterval)
        self.membersCount = dict["membersCount"] as? UInt ?? 0
        self.adminUids = dict["adminUids"] as? [String] ?? []
        self.membersUids = dict["membersUids"] as? [String] ?? []
        // Convert members dictionary to User array
        self.members = (dict["members"] as? [[String: Any]] ?? []).compactMap { User($0) }
          // Convert messages dictionary to Message array
        self.messages = (dict["messages"] as? [[String: Any]] ?? []).compactMap { Message($0) }
        // Convert groupChatImage to URL, using a default URL if necessary
        if let imageString = dict["thumbnailUrl"] as? String, let url = URL(string: imageString) {
            self.groupChatImage = url
        } else {
            self.groupChatImage = URL(string: "<https://default.com/default.png>")!
        }
        self.groupChatDescription = dict["groupChatDescription"] as? String ?? ""
        self.createdBy = dict["createdBy"] as? String ?? ""
        self.friend = dict["friend"] as? String ?? ""
    }
                  
}
                  


struct User: Identifiable {
    let id: UUID
    let name: String
    var image: UIImage?
    var social: String?
}
      

struct Message: Identifiable {
    let id: UUID
    let sender: User
    let content: String
    let timestamp: Date
}


extension User {
    init(_ dict: [String: Any]) {
        self.id = UUID(uuidString: dict["id"] as? String ?? "") ?? UUID()
        self.name = dict["firstName"] as? String ?? ""
        self.image = dict["image"] as? UIImage
        self.social = dict["social"] as? String
    }
}


extension Message {
    init(_ dict: [String: Any]) {
        self.id = UUID(uuidString: dict["id"] as? String ?? "") ?? UUID()
        self.sender = User(dict["sender"] as? [String: Any] ?? [:])
        self.content = dict["content"] as? String ?? ""
        let timestampInterval = dict["timestamp"] as? Double ?? 0
        self.timestamp = Date(timeIntervalSince1970: timestampInterval)
    }
}

