//
//  NewGroupViewModel.swift
//  AnonymousChat
//
//  Created by Yamil on 8/3/24.
//

import Foundation

enum ChatCreationRoute {
    case addGroupChatMembers
    case setUpGroupChat
}

final class NewGroupViewModel: ObservableObject {
    @Published var navStack = [ChatCreationRoute]()
}
