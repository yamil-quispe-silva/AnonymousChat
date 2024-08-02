
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
    
    
    //          FOR PREVIEW:
    init(users: [User] = []) {
        _users = State(initialValue: users)
    }
    
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    ForEach(Array(stride(from: 0, to: users.count, by: 3)), id: \.self) { index in
                        ContactRow(users: Array(users[index..<min(index + 3, users.count)]))
                    }
                }
            }
            .frame(maxWidth: .infinity)
            
        }
        .frame(maxWidth: .infinity)
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

#Preview {
    SelectMembersView(users: [
        User(id: UUID(), name: "Alice", image: nil, social: "alice123"),
        User(id: UUID(), name: "Bob", image: nil, social: "bob123"),
        User(id: UUID(), name: "Charlie", image: nil, social: "charlie123"),
        User(id: UUID(), name: "David", image: nil, social: "david123"),
        User(id: UUID(), name: "Eve", image: nil, social: "eve123"),
        User(id: UUID(), name: "Frank", image: nil, social: "frank123")
    ])
}
