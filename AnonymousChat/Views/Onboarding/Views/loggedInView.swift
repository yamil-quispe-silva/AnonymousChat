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


struct LoggedInView: View {
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
                
                Text("Logged In")
                    .font(Font.custom("Swis721 BlkRnd BT", size: 26).weight(.black))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 337, height: 89, alignment: .center)
               
                Text(userViewModel.email)
                        .font(Font.custom("Swis721 BlkRnd BT", size: 12))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                Text(userViewModel.password)
                        .font(Font.custom("Swis721 BlkRnd BT", size: 12))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
//                }
               Spacer()
                
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
