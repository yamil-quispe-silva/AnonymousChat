//
//  User.swift
//  AnonymousChat
//
//  Created by Yamil on 8/4/24.
//

import Foundation
import UIKit


struct User: Identifiable, Hashable {
    let id: UUID
    let name: String
    var image: UIImage?
    var social: String?
    
    static let placeholder = User(id: UUID(), name: "Osas", image: nil, social: nil)
    
    static let placeholders: [User] = [        
        User(id: UUID(), name: "Osas", image: nil, social: nil),
        User(id: UUID(), name: "JohnDoe", image: nil, social: nil),
        User(id: UUID(), name: "JaneSmith", image: nil, social: nil),
        User(id: UUID(), name: "Alice", image: nil, social: nil),
        User(id: UUID(), name: "Bob", image: nil, social: nil),
        User(id: UUID(), name: "Ella", image: nil, social: nil),
        User(id: UUID(), name: "Michael", image: nil, social: nil),
        User(id: UUID(), name: "Sophie", image: nil, social: nil),
        User(id: UUID(), name: "David", image: nil, social: nil),
        User(id: UUID(), name: "Emily", image: nil, social: nil)
    ]

    
}


extension User {
    init(_ dict: [String: Any]) {
        self.id = UUID(uuidString: dict["id"] as? String ?? "") ?? UUID()
        self.name = dict["firstName"] as? String ?? ""
        self.image = dict["image"] as? UIImage
        self.social = dict["social"] as? String
    }
}
