//
//  Message.swift
//  AnonymousChat
//
//  Created by Yamil on 8/4/24.
//

import Foundation

struct Message: Identifiable {
    let id: UUID
    let sender: User
    let content: String
    let timestamp: Date
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



