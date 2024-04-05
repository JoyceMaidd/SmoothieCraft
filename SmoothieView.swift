//
//  SwiftUIView.swift
//  
//
//  Created by JoyceMai on 2024/2/15.
//

import SwiftUI

struct SmoothieView: View {
    
    var body: some View {
        NavigationStack{
            TabView{
                HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                
                GalleryView(screenshotImage: .constant(nil))
                    .tabItem {
                        Image(systemName: "photo.on.rectangle")
                        Text("Gallery")
                    }
            }
            .accentColor(Color(red: 255/255, green: 104/255, blue: 104/255))
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    SmoothieView()
}
