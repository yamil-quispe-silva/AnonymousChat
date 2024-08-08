//
//  ProfilePicker.swift
//  AnonymousChat
//
//  Created by Tejeshwar Natarajan on 7/29/24.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore


struct ProfilePicker: View {
    var userViewModel: UserViewModel
    @State private var password: String = ""
    @State private var isTextFieldFocused: Bool = false
    @State private var shouldNavigate: Bool = false
    @State private var shouldShowImagePicker = false
    
//    @State var loginStatusMessage = ""
//    @State var error = ""
    
    @State var image : UIImage?
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Select Profile Photo")
                    .font(Font.custom("Swis721 BlkRnd BT", size: 26).weight(.black))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 337, height: 89, alignment: .center)
//                Spacer()
                
                ZStack {
                    
                    Button {
                        shouldShowImagePicker.toggle()
                    } label : {
                        VStack {
                            if let image = self.image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 256, height: 256)
                                    .cornerRadius(128)
                            } else if (userViewModel.image != nil) {
                                Image(uiImage: userViewModel.image!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 256, height: 256)
                                    .cornerRadius(128)
                            } else {
                                Image(systemName: "person.fill")
                                    .resizable()
//                                    .scaledToFill()
                                    .frame(width: 256, height: 256)
                                    .cornerRadius(128)
                                    .foregroundColor(Color(.white))
                            }
                        }
                        .overlay(RoundedRectangle(cornerRadius: 256).stroke(Color.white, lineWidth: 3))
                    }

                }
                .padding(.top)
                .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                    ImagePicker(image: $image)
                }
                
                Spacer()
                
                Button(action: {
                    Task {
                        userViewModel.image = image
                        userViewModel.persistImageToStorage()
                    }
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(red: 0.96, green: 0.43, blue: 0.01))
                            .frame(width: 395, height: 54)
                            .cornerRadius(30)
                        
                        HStack {
                            Text("Continue")
                                .font(Font.custom("Swis721 BlkRnd BT", size: 17).weight(.black))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                                .frame(width: 96, height: 27, alignment: .center)
                            
                            Image(systemName: "arrowshape.up.fill")
                                .frame(width: 12, height: 14.56795)
                                .rotationEffect(Angle(degrees: 90))
                                .foregroundColor(Color.white)
                        }
                    }
                }
                .padding(.bottom)
                
//                if self.loginStatusMessage.hasPrefix("Failed") {
                Text(userViewModel.error)
                        .font(Font.custom("Swis721 BlkRnd BT", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
//                }

                
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
            .navigationBarHidden(false)
            
        }
        
    }
    

    
//    private func persistImageToStorage() {
////        let filename = UUID().uuidString
//        guard let uid = Auth.auth().currentUser?.uid
//        else { return }
//        print(uid)
//        let ref = Storage.storage().reference(withPath: uid)
//        print(self.image)
//        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
//        ref.putData(imageData, metadata: nil) { metadata, err in
//            if let err = err {
//                self.loginStatusMessage = "Failed to push image to Storage: \(err)"
//                return
//            }
//            
//            ref.downloadURL { url, err in
//                if let err = err {
//                    self.loginStatusMessage = "Failed to retrieve downloadURL: \(err)"
//                    return
//                }
//                
//                self.loginStatusMessage = "Successfully stored image with url : \(url?.absoluteString ?? "")"
//                
////                self.storeUserInfo(imageProfileUrl: url ?? <#default value#>)
//            }
//        }
//    }
    
//    private func storeUserInfo(imageProfileUrl: URL) {
//        guard let uid = Auth.auth().currentUser?.uid else {
//            return
//        }
//        let userData = ["email" self.email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString ]
//        Firestore.firestore().collection("users")
//            .document(uid).setData(
//    }
}
