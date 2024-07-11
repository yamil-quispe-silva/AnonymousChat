//
//  CreateLoginView.swift
//  AnonymousChat
//
//

import SwiftUI
import Firebase
import FirebaseAuth

struct CreateLogin: View {@State private var email: String = ""
    @State private var password: String = ""
    @State private var isTextFieldFocused: Bool = false
    @State private var shouldNavigate: Bool = false

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Create Account")
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
                        TextField("Email", text: $email)
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
                        SecureField("Password", text: $password)
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
                
                if self.loginStatusMessage.hasPrefix("Failed") {
                    Text(self.error)
                        .font(Font.custom("Swis721 BlkRnd BT", size: 12).weight(.black))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
                
                // Continue button
                Button(action: {
                    Task {
                        shouldNavigate = false
                        print(shouldNavigate)
                        await createNewAccount {
                            if !email.isEmpty && !password.isEmpty && !self.loginStatusMessage.hasPrefix("Failed") {
                                print(shouldNavigate)
                                shouldNavigate = true
                            }
                        }
                    }
                }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(email.isEmpty || password.isEmpty ? Color(red: 0.14, green: 0.14, blue: 0.15) : Color(red: 0.96, green: 0.43, blue: 0.01))
                                .frame(width: 395, height: 54)
                                .cornerRadius(30)
                            
                            HStack {
                                Text("Continue")
                                    .font(Font.custom("Swis721 BlkRnd BT", size: 17).weight(.black))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(email.isEmpty || password.isEmpty ? Color(red: 0.31, green: 0.31, blue: 0.32) : Color.white)
                                    .frame(width: 96, height: 27, alignment: .center)
                                
                                Image(systemName: "arrowshape.up.fill")
                                    .frame(width: 12, height: 14.56795)
                                    .rotationEffect(Angle(degrees: 90))
                                    .foregroundColor(email.isEmpty || password.isEmpty ? Color(red: 0.31, green: 0.31, blue: 0.32) : Color.white)
                            }
                        }
                        .disabled(email.isEmpty || password.isEmpty)
                }
                .padding(.bottom)
                
                NavigationLink(destination: ContactsView(), isActive: $shouldNavigate) {
                    EmptyView()
                }


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
    
    
    @State var loginStatusMessage = ""
    @State var error = ""
    
    private func createNewAccount(completion: @escaping () -> Void) async {
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.loginStatusMessage = "Failed to create user: \(err)"
                self.error = "\(err.localizedDescription)"
            } else {
                print("Successfully created user: \(result?.user.uid ?? "")")
                self.loginStatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
            }
            completion()
        }
    }

//    private func createNewAccount() async {
//        Auth.auth().createUser(withEmail: email, password: password) {
//            result, err in
//            if let err = err {
//                print ("Failed to create user:", err)
//                self.loginStatusMessage = "Failed to create user: \(err)"
//                return
//            }
//            print ("Successfully created user: \(result?.user.uid ?? "")")
//            self.loginStatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
//        }
//    }
}

#Preview {
    CreateLogin()
}
