
//
//  ContactRow.swift
//  AnonymousChat
//
//  Created by Yamil on 8/1/24.
//

import SwiftUI


struct ContactRow: View {
    var users: [User]
    
    var body: some View {
        HStack {
            ForEach(users, id: \.id) { user in
                ContactBubble(
                    name: user.name,
                    image: user.image,
                    social: user.social
                )
                .padding()
                .padding(.horizontal, 3)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    
}

#Preview {
    ContactRow(users: [User(id: UUID(), name: "Mauricio Cortez"),User(id: UUID(), name: "Yamil Quispe"), User(id: UUID(), name: "Issa Miranda") ])
}
