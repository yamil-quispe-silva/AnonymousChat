
//
//  ContactBubble.swift
//  AnonymousChat
//
//  Created by Yamil on 8/1/24.
//

import SwiftUI


struct ContactBubble: View {
    var name: String
    var image: UIImage?
    var social: String?
    
    var body: some View {
        
        ZStack {
            
            
            //            Color.gray.edgesIgnoringSafeArea(.all)
            
            
            VStack {
                ZStack {
                    if let uiImage = image {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 85, height: 85)
                            .cornerRadius(23)
                    }; if image == nil {
                        ZStack {
                            Image("orangeback")
                                .resizable()
                                .frame(width: 85, height: 85)
                                .cornerRadius(23)
                            
                            Text(String(name.prefix(1)).uppercased())
                                .font(
                                    Font.custom("Swis721 BlkRnd BT", size: 47)
                                        .weight(.black)
                                )
                                .foregroundColor(.white)
                                .shadow(color:.black ,radius: 1, x: 1, y: 1)
                            
                        }
                        
                    }
                }
                .padding(.bottom, -1)
                
                Text(name)
                    .padding(.top, -3)
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 14))
                    .foregroundColor(.white)
                    .frame(width: 85, height: 35)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .clipped()
            }
            
        }
        
    }
    
    
}

#Preview {
    VStack {
        ContactBubble(name: "Yamil", image: nil, social: nil) // No image
        ContactBubble(name: "Yamil", image: UIImage(systemName: "person.fill"), social: nil) // With image
    }
}
