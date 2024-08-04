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
    
}


extension User {
    init(_ dict: [String: Any]) {
        self.id = UUID(uuidString: dict["id"] as? String ?? "") ?? UUID()
        self.name = dict["firstName"] as? String ?? ""
        self.image = dict["image"] as? UIImage
        self.social = dict["social"] as? String
    }
}
