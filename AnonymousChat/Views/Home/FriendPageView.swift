
//
//  FriendPageView.swift
//  AnonymousChat
//
//  Created by Vishnesh Jayanthi Ramanathan
//

import SwiftUI

struct FriendPageView: View {
    @Binding var isHomePageActive: Bool
    @State private var selectedChatIndex = 0
    @State private var isHeartFilled = false
    
    let friendChats: [Chat] = [
        // Example data. Replace with actual data.
        Chat(
            id: UUID().uuidString,
            chatName: "Go Cata #46 🔥👀",
            messages: [
                Message(id: UUID(), sender: User(id: UUID(), name: "Mauricio Cortez"), content: "que fue chicos", timestamp: Date()),
                Message(id: UUID(), sender: User(id: UUID(), name: "Mauricio Cortez"), content: "jajajajaj dale ntppp", timestamp: Date()),
                Message(id: UUID(), sender: User(id: UUID(), name: "Mauricio Cortez"), content: "JAJAJAJAJAJAJAJAJ 😂😂😂", timestamp: Date())
            ],
            creationDate: Date(),
            lastMessageTimeStamp: Date(),
            membersCount: 2,
            adminUids: [],
            membersUids: [],
            members: [User(id: UUID(), name: "Mauricio Cortez")],
            groupChatImage: URL(string: "https://12345.com")!,
            groupChatDescription: "Chat description here",
            createdBy: "User1",
            friend: UUID().uuidString
        ),
        Chat(
            id: UUID().uuidString,
            chatName: "Go Cata #46 🔥👀",
            messages: [
                Message(id: UUID(), sender: User(id: UUID(), name: "Mauricio Cortez"), content: "que fue chicos", timestamp: Date()),
                Message(id: UUID(), sender: User(id: UUID(), name: "Mauricio Cortez"), content: "jajajajaj dale ntppp", timestamp: Date()),
                Message(id: UUID(), sender: User(id: UUID(), name: "Mauricio Cortez"), content: "JAJAJAJAJAJAJAJAJ 😂😂😂", timestamp: Date())
            ],
            creationDate: Date(),
            lastMessageTimeStamp: Date(),
            membersCount: 2,
            adminUids: [],
            membersUids: [],
            members: [User(id: UUID(), name: "Vishnesh Ramanathan")],
            groupChatImage: URL(string: "https://12345.com")!,
            groupChatDescription: "Chat description here",
            createdBy: "User2",
            friend: UUID().uuidString
        )
    ]
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Action for person button
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 40, height: 40)
                        Image(systemName: "person.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                }
                Spacer()
                Button(action: {
                    // Action for search button
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 40, height: 40)
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                }
            }
            .padding()

            Spacer()

            TabView(selection: $selectedChatIndex) {
                ForEach(friendChats.indices, id: \.self) { index in
                    VStack {
                        HStack {
                            AsyncImage(url: friendChats[index].groupChatImage) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())

                            Text(friendChats[index].members.map { $0.name }.joined(separator: ", "))
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        .padding()

                        ChatView(chat: friendChats[index])
                    }
                    .tag(index)
                }
                Text("End of chats reached")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .tag(friendChats.count)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 600) // Adjust height as needed

            Spacer()

            HStack {
                Button(action: {
                    isHeartFilled.toggle()
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 50, height: 50)
                        Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                }
                Spacer()
                Button(action: {
                    isHomePageActive = true
                }) {
                    Text("my chats")
                        .foregroundColor(isHomePageActive ? .white : .gray)
                        .fontWeight(.bold)
                }
                Spacer()
                Button(action: {
                    isHomePageActive = false
                }) {
                    Text("friends chats")
                        .foregroundColor(!isHomePageActive ? .white : .gray)
                        .fontWeight(.bold)
                }
                Spacer()
                Button(action: {
                    // Action for plus button
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 50, height: 50)
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                }
            }
            .padding()
            .background(Color.black)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
