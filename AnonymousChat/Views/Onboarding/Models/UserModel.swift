//
//  UserModel.swift
//  AnonymousChat
//
//

import Foundation
struct User : Identifiable{
    var id: ObjectIdentifier
    
    var uid: String
    var username: String
    var email: String
    var password: String
    var profileImage: String
    var bio: String
    var friends: [UUID]
    var number : String
    var school : String
    var fname : String
    var lname : String
//    var chats: [Chat]
//    var chatsRejected: [Chat]
}
