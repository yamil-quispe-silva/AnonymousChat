//
//  MessageListView.swift
//  AnonymousChat
//
//  Created by Yamil on 7/6/24.
//

import SwiftUI

struct MessageListView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MessageListController

    func makeUIViewController(context: Context) -> MessageListController {
        let messageListController = MessageListController()
        return messageListController
    }

    func updateUIViewController(_ uiViewController: MessageListController, context: Context) { }
}



#Preview {
    MessageListView()
        .edgesIgnoringSafeArea(.all)
}
