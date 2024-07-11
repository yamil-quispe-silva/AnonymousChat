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
    let direction: MessageDirection
    
    static let sentPlaceholder = MessageItem(text: "YOOO do you guys know", direction: .sent)
    static let receivedPlaceholder = MessageItem(text: "what happened 💀", direction: .received)
    
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
    
}

enum MessageDirection {
    case sent, received
    
    static var random: MessageDirection {
        return [MessageDirection.sent, .received].randomElement() ?? .sent
    }
}

