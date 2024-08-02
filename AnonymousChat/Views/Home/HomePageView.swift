
//
//  HomePageView.swift
//  AnonymousChat
//
//  Created by Vishnesh Jayanthi Ramanathan
//

import SwiftUI

struct HomePageView: View {
    @Binding var isHomePageActive: Bool
    @State private var selectedChatIndex = 0
    @State private var isHeartFilled = false

    let yourChats: [Chat] = [
        // Example data. Replace with actual data.
        Chat( 
            id: UUID().uuidString,
            chatName: "VDP PROM 👀",
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
            chatName: "DTYF GALA 🔥",
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
        NavigationStack {
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
                    ForEach(yourChats.indices, id: \.self) { index in
                        VStack {
                            Text(yourChats[index].chatName ?? "Unnamed Chat")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.top)
                            ChatView(chat: yourChats[index], blurMessages: true)
                                .padding(.bottom)
                        }
                        .tag(index)
                    }
                    Text("End of chats reached")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .tag(yourChats.count)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .rotationEffect(.degrees(0)) // Ensure no rotation
                .frame(height: UIScreen.main.bounds.height * 0.7) // Adjust height as needed
                .clipped()
                .background(Color.black.edgesIgnoringSafeArea(.all))
                
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
                    NavigationLink(destination: SelectMembersView()) {
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
}

