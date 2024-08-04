
//
//  SelectMembersView.swift
//  AnonymousChat
//
//  Created by Yamil on 8/1/24.
//

import SwiftUI
import Contacts

struct SelectMembersView: View {
    @State private var users: [User] = []
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = NewGroupViewModel()
    
    //          FOR PREVIEW:
    init(users: [User] = []) {
        _users = State(initialValue: users)
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.navStack) {
            ZStack {
                
                Color.black.edgesIgnoringSafeArea(.all)
                
//                ScrollView {
//                    VStack {
//                        ForEach(Array(stride(from: 0, to: users.count, by: 3)), id: \.self) { index in
//                            ContactRow(users: Array(users[index..<min(index + 3, users.count)]))
                            
//                            HStack {
//                                ForEach(users, id: \.id) { user in
//                                    ContactBubble(
//                                        name: user.name,
//                                        image: user.image,
//                                        social: user.social
//                                    )
//                                    .padding()
//                                    .padding(.horizontal, 3)
//                                }
//                            }
//                            .frame(maxWidth: .infinity)
//                            
//                            
//                        }
//                    }
//                }
//                .frame(maxWidth: .infinity)
//                .scrollIndicators(.hidden)
                
                
                
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(chunks(of: users, size: 3), id: \.self) { rowUsers in
                            HStack {
                                ForEach(rowUsers, id: \.id) { user in
                                    Button {
                                        
                                    } label: {
                                        contactBubbleView(.placeholder)
                                    }
                                }
                            }
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                        }
                    }
                    .padding()
                }
                
                
                
                
                
            }
            .frame(maxWidth: .infinity)
            .searchable(text: $searchText,
                        prompt: "Search name or number")
            .onAppear {
                // Customize the appearance of the search bar
                UISearchBar.appearance().barTintColor = UIColor.white
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(white: 2.5, alpha: 0.3) // Adjust this for desired opacity
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .black // Text color for visibility

                // Customize the navigation bar title
                let appearance = UINavigationBarAppearance()
                appearance.configureWithTransparentBackground()
                appearance.backgroundEffect = UIBlurEffect(style: .systemChromeMaterialDark)
                appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
            .navigationTitle("Select members")
            .navigationDestination(for: ChatCreationRoute.self) { route in
                
                destinationView(for: route)
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                trailingNavItem()
            }
            
        
            //fetch contacts call
            .onAppear() {
                
                
                //            PRODUCTION:
                //            Task.init {
                //                await fetchAllContacts()
                //            }
                
                
                
                //          FOR PREVIEW:
                if users.isEmpty {
                    Task.init {
                        await fetchAllContacts()
                    }
                }
                
                
        }
            
        }
    }
    
    private func contactBubbleView(_ user: User) -> some View {
        ContactBubble(name: user.name, image: user.image, social: user.social) {
            
            Image(systemName: "circle")
                .font(.title)
                .fontWeight(.black)
                .imageScale(.large)
                .frame(width: 38, height: 38)
                .background(Circle().fill(Color.black))
                .clipShape(Circle())
                .foregroundStyle(.white)
                .padding(.trailing, -13)
                .padding(.bottom, -12)
            
            
//            
//            Image(systemName: "checkmark.circle.fill")
//                .font(.title)
//                .fontWeight(.black)
//                .padding(2)
//                .foregroundStyle(.white)
//                .foregroundColor(.black)
//                .background(.black)
//                .background(.thinMaterial)
//                .clipShape(Circle())
//                .padding(.trailing, -14)
//                .padding(.bottom, -14)
//                .overlay {
//                    Image(systemName: "circle")
//                        .font(.title)
//                        .fontWeight(.black)
//                        .imageScale(.large)
//                        .frame(width: 59, height: 59)
//                        .background(Circle().fill(Color.clear))
//                        .clipShape(Circle())
//                        .foregroundStyle(.white)
//                        .padding(.trailing, -13)
//                        .padding(.bottom, -12)
//                }
            
        }
    }
    
    func fetchAllContacts() async {
        
        let store = CNContactStore()
        
        let keys = [CNContactGivenNameKey, CNContactPhoneNumbersKey, CNContactSocialProfilesKey, CNContactImageDataKey] as [CNKeyDescriptor]
        
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        
        var localUsers: [User] = []
        
        do {
            try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, result in
                
                let socialProfile = contact.socialProfiles.first?.value.username
                
                let user = User(
                    id: UUID(),
                    name: contact.givenName,
                    image: contact.imageData != nil ? UIImage(data: contact.imageData!) : nil,
                    social: socialProfile
                )
                
                localUsers.append(user)
                
                DispatchQueue.main.async {
                    self.users = localUsers // Store in the state variable to use in the UI
                }
                
            })
            
        } catch {
            print("Error")
        }
        
    }
    
    
}

extension SelectMembersView {
    
    @ViewBuilder
    private func destinationView(for route: ChatCreationRoute) -> some View {
        switch route {
        case .addGroupChatMembers:
            Text("ADD GROUP CHAT PARTNER")
        case .setUpGroupChat:
            Text("SETUP GROUP CHAT")
        }
    }
}



extension SelectMembersView {
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            cancelButton()
        }
    }
    
    private func cancelButton() -> some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.footnote)
                .bold()
                .foregroundStyle(.white.opacity(0.8))
                .padding(8)
                .background(Color(.white.opacity(0.15)))
                .clipShape(Circle())
        }
    }
    
    private func chunks<T>(of array: [T], size: Int) -> [[T]] {
        var chunks: [[T]] = []
        var currentChunk: [T] = []
        
        for (index, element) in array.enumerated() {
            currentChunk.append(element)
            if currentChunk.count == size || index == array.count - 1 {
                chunks.append(currentChunk)
                currentChunk = []
            }
        }
        
        return chunks
    }
    
    
}

#Preview {
    SelectMembersView(users: [
        User(id: UUID(), name: "Alice", image: nil, social: "alice123"),
        User(id: UUID(), name: "Bob", image: nil, social: "bob123"),
        User(id: UUID(), name: "Charlie", image: nil, social: "charlie123"),
        User(id: UUID(), name: "David", image: nil, social: "david123"),
        User(id: UUID(), name: "Eve", image: nil, social: "eve123"),
        User(id: UUID(), name: "Frank", image: nil, social: "frank123"),
        User(id: UUID(), name: "Alice", image: nil, social: "alice123"),
        User(id: UUID(), name: "Bob", image: nil, social: "bob123"),
        User(id: UUID(), name: "Charlie", image: nil, social: "charlie123"),
        User(id: UUID(), name: "David", image: nil, social: "david123"),
        User(id: UUID(), name: "Eve", image: nil, social: "eve123"),
        User(id: UUID(), name: "Frank", image: nil, social: "frank123"),
        User(id: UUID(), name: "Alice", image: nil, social: "alice123"),
        User(id: UUID(), name: "Bob", image: nil, social: "bob123"),
        User(id: UUID(), name: "Charlie", image: nil, social: "charlie123"),
        User(id: UUID(), name: "David", image: nil, social: "david123"),
        User(id: UUID(), name: "Eve", image: nil, social: "eve123"),
        User(id: UUID(), name: "Frank", image: nil, social: "frank123")
    ])
}
