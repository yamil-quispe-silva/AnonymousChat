//
//  NumberView.swift
//  AnonymousChat
//
//  Created by Yamil on 6/29/24.
//

import SwiftUI


struct NumberView: View {
    @State private var phoneNumber: String = ""
    @State private var isTextFieldFocused: Bool = false
    @State private var shouldNavigate: Bool = false
    var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("What’s your number?")
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
                        Text("🇵🇪")
                            .font(Font.custom("Swis721 BlkRnd BT", size: 21).weight(.black))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(width: 54, height: 56, alignment: .center)
                        
                        TextField("Enter your number", text: Binding(
                            get: { phoneNumber },
                            set: {
                                if $0.count <= 15 {
                                    phoneNumber = $0.filter { "0123456789".contains($0) }
                                }
                            }
                        ))
                        .keyboardType(.numberPad)
                        .font(Font.custom("Swis721 BlkRnd BT", size: 16).weight(.black))
                        .foregroundColor(.white)
                        .frame(height: 56, alignment: .leading)
                        .onTapGesture {
                            isTextFieldFocused = true
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                
                Text("By tapping Continue, you are agreeing to our Terms of Service and Privacy Policy")
                    .font(Font.custom("Inter", size: 12).weight(.bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.43, green: 0.42, blue: 0.43))
                    .frame(width: 271, height: 36, alignment: .center)
                    .padding(.top)
                
                Spacer()
                
                // Continue button
                NavigationLink(destination: VerifyPhoneView(userViewModel: userViewModel), isActive: $shouldNavigate) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(phoneNumber.isEmpty ? Color(red: 0.14, green: 0.14, blue: 0.15) : Color(red: 0.96, green: 0.43, blue: 0.01))
                            .frame(width: 395, height: 54)
                            .cornerRadius(30)
                        
                        HStack {
                            Text("Continue")
                                .font(Font.custom("Swis721 BlkRnd BT", size: 17).weight(.black))
                                .multilineTextAlignment(.center)
                                .foregroundColor(phoneNumber.isEmpty ? Color(red: 0.31, green: 0.31, blue: 0.32) : Color.white)
                                .frame(width: 96, height: 27, alignment: .center)
                            
                            Image(systemName: "arrowshape.up.fill")
                                .frame(width: 12, height: 14.56795)
                                .rotationEffect(Angle(degrees: 90))
                                .foregroundColor(phoneNumber.isEmpty ? Color(red: 0.31, green: 0.31, blue: 0.32) : Color.white)
                        }
                    }
                }
                .disabled(phoneNumber.isEmpty)
                .simultaneousGesture(TapGesture().onEnded {
                    userViewModel.number = phoneNumber
                    if !phoneNumber.isEmpty {
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
//    NumberView()
//}
