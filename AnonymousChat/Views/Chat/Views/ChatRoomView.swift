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
            
            
            
            VStack {
                MessageListView()
                    .ignoresSafeArea(.all)
                TextInputArea()
//                    .padding(.bottom, 15)
                
            }
            .background(
                ZStack {
                    Image("messageImage2")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    TransparentBlurView(removeAllFilters: true)
                        .blur(radius: 30)
                        .edgesIgnoringSafeArea(.all)
                        .padding(.horizontal, -20)
                        .visualEffect { view, proxy in
                            view
                                .offset(y:proxy.bounds(of: .scrollView)?.minY ?? 0)
                            
                        }
                    
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.3))
                        .edgesIgnoringSafeArea(.all)
                }
                
                
            )
            .onTapGesture {
                self.dismissKeyboard()
            }

            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                leadingNavItems()
                trailingNavItems()
            }
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
