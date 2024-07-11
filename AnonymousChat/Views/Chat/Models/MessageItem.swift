//
//  MessageItem.swift
//  AnonymousChat
//
//  Created by Yamil on 7/9/24.
//

import Foundation
import SwiftUI

struct MessageItem: Identifiable {
    let id = UUID().uuidString
    let text: String
    let type: MessageType
    let direction: MessageDirection
    
    static let sentPlaceholder = MessageItem(text: "YOOO do you guys know", type: .text, direction: .sent)
    static let receivedPlaceholder = MessageItem(text: "what happened 💀", type: .text, direction: .received)
    
    var alignment: Alignment {
        return direction == .received ? .leading : .trailing
    }
    
    var horizontalAlignment: HorizontalAlignment {
        return direction == .received ? .leading : .trailing
    }
    
    var backgroundColor: Color {
        return direction == .sent ? Color(red: 0.92, green: 0.91, blue: 0.91) : Color(red: 0.21, green: 0.18, blue: 0.17)
    }
    var textColor: Color {
        return direction == .sent ? .black : .white
    }
    
    static let stubMessages: [MessageItem] = [
        MessageItem(text: "Hi There", type: .text, direction: .sent),
        MessageItem(text: "Check out this Photo", type: .photo, direction: .received),
        MessageItem(text: "Play out this Video", type: .video, direction: .sent)
    ]

    
    
}

enum MessageType {
    case text, photo, video
}

enum MessageDirection {
    case sent, received
    
    static var random: MessageDirection {
        return [MessageDirection.sent, .received].randomElement() ?? .sent
    }
}

