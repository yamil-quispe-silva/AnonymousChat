//
//  UserViewModel.swift
//  AnonymousChat
//
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import FirebaseCore

class FirebaseManager : NSObject {
    let auth : Auth
    let storage : Storage
    let firestore : Firestore
    
    static let shared = FirebaseManager()
    
    override init() {
//        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
}


class UserViewModel : Identifiable, ObservableObject {
    @Published var user: User
    @Published var loginStatusMessage = ""
    @Published var error = ""
    @Published var image : UIImage?
    
    init(user: User = User(id: ObjectIdentifier(User.self), uid: "", username: "", email: "", password: "", profileImage: "", bio: "", friends: [], number: "", school: "", fname: "", lname: "")) {
        self.user = user
    }
    
    var uid: String {
        get {
            user.uid
        }
        set {
            user.uid = newValue
        }
    }
    
    var username: String {
        get {
            user.username
        }
        set {
            user.username = newValue
        }
    }
    
    var email: String {
        get {
            user.email
        }
        set {
            user.email = newValue
        }
    }
    
    var password: String {
        get {
            user.password
        }
        set {
            user.password = newValue
        }
    }
    
    var profileImage: String {
        get {
            user.profileImage
        }
        set {
            user.profileImage = newValue
        }
    }
    
    var bio: String {
        get {
            user.bio
        }
        set {
            user.bio = newValue
        }
    }
    
    var number: String {
        get {
            user.number
        }
        set {
            user.number = newValue
        }
    }
    
    var school: String {
        get {
            user.school
        }
        set {
            user.school = newValue
        }
    }
    
    var fname: String {
        get {
            user.fname
        }
        set {
            user.fname = newValue
        }
    }
    
    var lname: String {
        get {
            user.lname
        }
        set {
            user.lname = newValue
        }
    }
    
    var friends: [UUID] {
        return user.friends
    }
    
    //    var chats: [Chat] {
    //        return user.chats
    //    }
    //
    //    var chatsRejected: [Chat] {
    //        return user.chatsRejected
    //    }
    
    func createNewAccount(email: String, password: String, completion: @escaping () -> Void) async {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.loginStatusMessage = "Failed to create user: \(err)"
                self.error = "\(err.localizedDescription)"
            } else {
                print("Successfully created user: \(result?.user.uid ?? "")")
                self.loginStatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
            }
            self.email = email
            self.password = password
            completion()
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping () -> Void) async {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user:", err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                self.error = "\(err.localizedDescription)"
            } else {
                print("Successfully logged in user: \(result?.user.uid ?? "")")
                self.loginStatusMessage = "Successfully logged in user: \(result?.user.uid ?? "")"
            }
            self.email = email
            self.password = password
            completion()
        }
    }
    
    func persistImageToStorage() {
        //        let filename = UUID().uuidString
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid
        else { return }
        print(uid)
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        print(self.image)
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                self.loginStatusMessage = "Failed to push image to Storage: \(err)"
                return
            }
            
            ref.downloadURL { url, err in
                if let err = err {
                    self.loginStatusMessage = "Failed to retrieve downloadURL: \(err)"
                    return
                }
                
                self.loginStatusMessage = "Successfully stored image with url : \(url?.absoluteString ?? "")"
                print("Done!")
                guard let url = url else { return }
                self.storeUserInfo(imageProfileUrl: url)
            }
        }
    }
    
    private func storeUserInfo(imageProfileUrl: URL) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            return
        }
        let userData = ["username": self.username, "email": self.email, "password": self.password, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString, "bio": self.bio, "number": self.number, "school": self.school, "fname": self.fname, "lname": self.lname]
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData) { err in
                if let err = err {
                    print(err)
                    self.loginStatusMessage = "\(err)"
                    return
                }
                
                print("Success")
            }
    }
    
    func fetchCurrentUser() async {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            return
        }
        
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).getDocument { snapshot, err in
                if let err = err {
                    print("Failed to fetch current user:", err)
                    self.loginStatusMessage = "\(err)"
                    return
                }
                
                guard let data = snapshot?.data() else {
                    self.loginStatusMessage = "No data"
                    return
                }
                
                self.username = data["username"] as? String ?? ""
                self.uid = data["uid"] as? String ?? ""
                self.email = data["email"] as? String ?? ""
                self.password = data["password"] as? String ?? ""
                self.profileImage = data["profileImageUrl"] as? String ?? ""
                self.bio = data["bio"] as? String ?? ""
                self.number = data["number"] as? String ?? ""
                self.school = data["school"] as? String ?? ""
                self.fname = data["fname"] as? String ?? ""
                self.lname = data["lname"] as? String ?? ""
            }
        
    }
}
