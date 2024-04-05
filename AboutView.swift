//
//  SwiftUIView.swift
//  
//
//  Created by JoyceMai on 2024/2/25.
//

import SwiftUI

struct AboutView: View {
    @State private var currentPage = 0
        
        var body: some View {
            ZStack {
                TabView(selection: $currentPage) {
                    IntroductionView()
                        .tag(0)
                        .transition(.slide)
                    
                    HintView()
                        .tag(1)
                        .transition(.slide)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(BackgroundBlurView())
            }
        }
}

#Preview {
    AboutView()
}
