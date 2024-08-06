//
//  SectionSelectedContacts.swift
//  AnonymousChat
//
//  Created by Yamil on 8/5/24.
//

import SwiftUI

struct SectionSelectedContacts: View {
    
    let users: [User]
    let onTapHandler: (_ user: User) -> Void
    
    var body: some View {
        ZStack {
            
//            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -20) { // Adjust the spacing if needed
                    ForEach(users) { user in
                        contactBubbleSelected(user)
                    }
                }
            }
        }
    }
    
    private func contactBubbleSelected(_ user: User) -> some View {
        ZStack {
            ContactBubble(name: user.name, image: user.image, social: user.social)
                .overlay(alignment: .topTrailing) {
                    cancelButton(user)
                        .padding(.trailing, 12)
                    
                }
        }
    }
    
    private func cancelButton(_ user: User) -> some View {
        Button {
            onTapHandler(user)
        } label: {
            Image(systemName: "xmark")
                .imageScale(.small)
                .foregroundStyle(.black)
                .fontWeight(.bold)
                .padding(8)
                .background(Color(.white))
                .clipShape(Circle())
        }
    }
    
}

#Preview {
    SectionSelectedContacts(users: User.placeholders) { user in
        
    }
}
