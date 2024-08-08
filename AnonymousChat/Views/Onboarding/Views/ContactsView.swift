//
//  ContactsView.swift
//  AnonymousChat
//
//  Created by Yamil on 6/29/24.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Text("🌎")
                    .font(
                        Font.custom("Swis721 BlkRnd BT", size: 130)
                            .weight(.black)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 181, height: 135, alignment: .center)
                
                
                Text("Import Contacts")
                    .font(
                        Font.custom("Swis721 BlkRnd BT", size: 20)
                            .weight(.black)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.72, green: 0.71, blue: 0.69))
                    .frame(width: 324, height: 71, alignment: .center)
                
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 276, height: 54)
                        .background(Color(red: 0.96, green: 0.43, blue: 0.01))
                        .cornerRadius(30)
                    
                    HStack {
                        Image(systemName: "person.2.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                        
                        Text("Find My Friends")
                            .font(
                                Font.custom("Swis721 BlkRnd BT", size: 17)
                                    .weight(.black)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 146, height: 27, alignment: .center)
                    }
                }
                
                .buttonStyle(PlainButtonStyle()) // Optional: to remove any default button styling
                
                Spacer()
                
                Text("Side-eye cares about your privacy.\nContacts are only used to show you relevant chats.")
                    .font(
                        Font.custom("Inter", size: 13)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.43, green: 0.42, blue: 0.43))
                    .frame(width: 271, height: 36, alignment: .center)
            }
        }
        
    }
}

#Preview {
    ContactsView()
}
