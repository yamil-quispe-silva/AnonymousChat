
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
    
    //          FOR PREVIEW:
    init(users: [User] = []) {
        _users = State(initialValue: users)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.black.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        ForEach(Array(stride(from: 0, to: users.count, by: 3)), id: \.self) { index in
                            ContactRow(users: Array(users[index..<min(index + 3, users.count)]))
                        }
                    }
                }
//                .frame(maxWidth: .infinity)
//                .scrollIndicators(.hidden)
                
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
