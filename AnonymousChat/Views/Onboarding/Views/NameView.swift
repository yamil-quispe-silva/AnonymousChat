//
//  NameView.swift
//  AnonymousChat
//
//  Created by Yamil on 6/29/24.
//

import SwiftUI

struct NameView: View {@State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var isTextFieldFocused: Bool = false
    @State private var shouldNavigate: Bool = false
    var userViewModel: UserViewModel

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("What's your name?")
                    .font(Font.custom("Swis721 BlkRnd BT", size: 26).weight(.black))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 337, height: 89, alignment: .center)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 382, height: 56)
                        .background(Color(red: 0.15, green: 0.15, blue: 0.14))
                        .cornerRadius(18)
                    
                    HStack {
                        TextField("First Name", text: $firstName)
                            .font(Font.custom("Swis721 BlkRnd BT", size: 16))
                            .foregroundColor(.white)
                            .frame(height: 56, alignment: .leading)
                            .padding(.horizontal)
                            .onTapGesture {
                                isTextFieldFocused = true
                            }
                    }
                }
                .padding(.top)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 382, height: 56)
                        .background(Color(red: 0.15, green: 0.15, blue: 0.14))
                        .cornerRadius(18)
                    
                    HStack {
                        TextField("Last Name", text: $lastName)
                            .font(Font.custom("Swis721 BlkRnd BT", size: 16))
                            .foregroundColor(.white)
                            .frame(height: 56, alignment: .leading)
                            .padding(.horizontal)
                            .onTapGesture {
                                isTextFieldFocused = true
                            }
                    }
                }
                .padding(.top)
                
                Spacer()
                
                // Continue button
                NavigationLink(destination: CreateLogin(userViewModel: userViewModel), isActive: $shouldNavigate) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(firstName.isEmpty || lastName.isEmpty ? Color(red: 0.14, green: 0.14, blue: 0.15) : Color(red: 0.96, green: 0.43, blue: 0.01))
                            .frame(width: 395, height: 54)
                            .cornerRadius(30)
                        
                        HStack {
                            Text("Continue")
                                .font(Font.custom("Swis721 BlkRnd BT", size: 17).weight(.black))
                                .multilineTextAlignment(.center)
                                .foregroundColor(firstName.isEmpty || lastName.isEmpty ? Color(red: 0.31, green: 0.31, blue: 0.32) : Color.white)
                                .frame(width: 96, height: 27, alignment: .center)
                            
                            Image(systemName: "arrowshape.up.fill")
                                .frame(width: 12, height: 14.56795)
                                .rotationEffect(Angle(degrees: 90))
                                .foregroundColor(firstName.isEmpty || lastName.isEmpty ? Color(red: 0.31, green: 0.31, blue: 0.32) : Color.white)
                        }
                    }
                }
                .disabled(firstName.isEmpty || lastName.isEmpty)
                .simultaneousGesture(TapGesture().onEnded {
                    userViewModel.fname = firstName
                    userViewModel.lname = lastName
                    if !firstName.isEmpty && !lastName.isEmpty {
                        shouldNavigate = true
                    }
                })
                .padding(.bottom)
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
            .navigationBarHidden(false)
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                isTextFieldFocused = true
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                isTextFieldFocused = false
            }
        }
    }
}

//#Preview {
//    NameView()
//}
