//
//  IntroPageView.swift
//  AnonymousChat
//
//  Created by Yamil on 6/29/24.
//

import SwiftUI

struct IntroPageView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("Send message anonymously in your friend groupchat!")
                        .font(
                            Font.custom("Swis721 BlkRnd BT", size: 20)
                                .weight(.black)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.72, green: 0.71, blue: 0.69))
                        .frame(width: 324, height: 71, alignment: .center)
                    
                    NavigationLink(destination: FindSchoolView()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 240, height: 54)
                                .background(Color(red: 0.96, green: 0.43, blue: 0.01))
                                .cornerRadius(30)
                            
                            Text("Create an account")
                                .font(
                                    Font.custom("Swis721 BlkRnd BT", size: 17)
                                        .weight(.black)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 192, height: 27, alignment: .center)
                        }
                    }
                    .buttonStyle(PlainButtonStyle()) // Optional: to remove any default button styling
                    
                    Text("Sign in")
                        .font(
                            Font.custom("Swis721 BlkRnd BT", size: 17)
                                .weight(.black)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.72, green: 0.71, blue: 0.69))
                        .frame(width: 209, height: 49, alignment: .center)
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    IntroPageView()
}
