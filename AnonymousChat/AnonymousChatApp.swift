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
    
    init() {
        initFirebase()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            IntroPageView()
        }
    }
}
