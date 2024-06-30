//
//  VerifyPhoneView.swift
//  AnonymousChat
//
//  Created by Yamil on 6/29/24.
//

import SwiftUI

struct VerifyPhoneView: View {
    @State private var code: String = ""
    @State private var isTextFieldFocused: Bool = false
    @State private var shouldNavigate: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Verify your number")
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
                        TextField("Enter verification code", text: Binding(
                            get: { code },
                            set: {
                                if $0.count <= 15 {
                                    code = $0.filter { "0123456789".contains($0) }
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
                
                Text("Code sent to your number!")
                    .font(Font.custom("Swis721 BlkRnd BT", size: 14).weight(.black))
                    .foregroundColor(Color(.gray))
                    .frame(height: 1, alignment: .leading)
                    .padding(.top)
                
                Text("Try again in 25 secs")
                    .font(Font.custom("Swis721 BlkRnd BT", size: 13).weight(.black))
                    .foregroundColor(Color(red: 0.43, green: 0.42, blue: 0.43))
                    .frame(height: 1, alignment: .leading)
                    .padding(.top)
                
                Spacer()
                
                // Continue button
                NavigationLink(destination: NameView(), isActive: $shouldNavigate) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(code.isEmpty ? Color(red: 0.14, green: 0.14, blue: 0.15) : Color(red: 0.96, green: 0.43, blue: 0.01))
                            .frame(width: 395, height: 54)
                            .cornerRadius(30)
                        
                        HStack {
                            Text("Continue")
                                .font(Font.custom("Swis721 BlkRnd BT", size: 17).weight(.black))
                                .multilineTextAlignment(.center)
                                .foregroundColor(code.isEmpty ? Color(red: 0.31, green: 0.31, blue: 0.32) : Color.white)
                                .frame(width: 96, height: 27, alignment: .center)
                            
                            Image(systemName: "arrowshape.up.fill")
                                .frame(width: 12, height: 14.56795)
                                .rotationEffect(Angle(degrees: 90))
                                .foregroundColor(code.isEmpty ? Color(red: 0.31, green: 0.31, blue: 0.32) : Color.white)
                        }
                    }
                }
                .disabled(code.isEmpty)
                .simultaneousGesture(TapGesture().onEnded {
                    if !code.isEmpty {
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


#Preview {
    VerifyPhoneView()
}
