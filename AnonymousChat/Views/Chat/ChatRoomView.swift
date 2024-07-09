//
//  ChatRoomView.swift
//  AnonymousChat
//
//  Created by Yamil on 7/6/24.
//

import SwiftUI

struct ChatRoomView: View {
    var body: some View {
        
        ZStack {
            Color.clear
                .edgesIgnoringSafeArea(.all)
            
            MessageListView()
                .ignoresSafeArea(.all)
                
            
            
            BlurView()
            
            VStack {
                Spacer()
                
                TextInputArea()

                
            }
            

            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                leadingNavItems()
                trailingNavItems()
            }
        }
        .onTapGesture {
            self.dismissKeyboard()
        }
        
    }
}

extension ChatRoomView {
    @ToolbarContentBuilder
    private func leadingNavItems() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            HStack {
                Circle()
                    .frame(width: 35, height: 30)
                Text("QaUser12")
                    .bold()
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItems() -> some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button {
            } label: {
                Image(systemName: "app.dashed")
                    .fontWeight(.bold)
//                    .imageScale(.small)
            }
        }
    }
}


extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



//extension UIApplication {
//    func endEditing() {
//        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}


#Preview {
    NavigationStack {
        ChatRoomView()
    }
}
