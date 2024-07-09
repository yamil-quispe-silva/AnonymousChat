//
//  BlurView.swift
//  AnonymousChat
//
//  Created by Yamil on 7/9/24.
//

import SwiftUI

struct BlurView: View {
    var body: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            
            ZStack {
                
//                Color(.black)
                
                VStack(spacing: 0) {
                    
                    // TOP BLUR
//                    TransparentBlurView(removeAllFilters: true)
//                        .blur(radius: 6)
//                        .frame(height: 124)
//                        .edgesIgnoringSafeArea(.top)
//                        .padding(.horizontal, -20)
//                        .padding(.top, -35)
//                        .visualEffect { view, proxy in
//                            view
//                                .offset(y:proxy.bounds(of: .scrollView)?.minY ?? 0)
//                            
//                        }
                    
                    
                        
                    
                    Spacer() // Pushes the bottom rectangle to the bottom of the screen
                    
                    
                    
                    // BOTTOM BLUR
                    
                    TransparentBlurView(removeAllFilters: true)
                        .blur(radius: 6)
                        .frame(height: 124)
                        .edgesIgnoringSafeArea(.bottom)
                        .padding(.horizontal, -20)
                        .padding(.bottom, -35)
                        .visualEffect { view, proxy in
                            view
                                .offset(y:proxy.bounds(of: .scrollView)?.minY ?? 0)
                            
                        }
                    

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    BlurView()
}
