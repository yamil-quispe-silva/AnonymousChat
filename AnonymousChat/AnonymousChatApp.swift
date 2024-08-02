
//
//  AnonymousChatApp.swift
//  AnonymousChat
//
//  Created by Yamil on 6/25/24.
//

import SwiftUI
import FirebaseCore

extension AnonymousChatApp {
  private func initFirebase() {
    FirebaseApp.configure()
  }
}
 

@main
struct AnonymousChatApp: App {
    
    @State private var isHomePageActive = false
    
    init() {
        initFirebase()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            NewChatView()
            HomePageView(isHomePageActive: $isHomePageActive)
        }
    }
}


