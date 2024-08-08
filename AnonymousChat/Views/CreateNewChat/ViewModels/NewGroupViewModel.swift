//
//  NewGroupViewModel.swift
//  AnonymousChat
//
//  Created by Yamil on 8/3/24.
//

import Foundation

enum ChatCreationRoute {
    case setUpGroupChat
}

enum chatConstants {
    static let maxGroupParticipants = 360
}


final class NewGroupViewModel: ObservableObject {
    @Published var navStack = [ChatCreationRoute]()
    @Published var selectedChatMembers = [User]()
    
    var showSelectedUsers: Bool {
        return !selectedChatMembers.isEmpty
    }
    
    var disableNextButton: Bool {
        return selectedChatMembers.isEmpty
    }
    
    func handleItemSelection(_ item: User) {
        if isUserSelected(item) {
            guard let index = selectedChatMembers.firstIndex(where: { $0.id == item.id }) else {return}
            selectedChatMembers.remove(at: index)
        } else {
            selectedChatMembers.append(item)
        }
    }
    
    func isUserSelected(_ user: User) -> Bool {
        return selectedChatMembers.contains { $0.id == user.id }
    }
}

