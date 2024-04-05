//
//  SwiftUIView.swift
//  
//
//  Created by JoyceMai on 2024/2/15.
//

import SwiftUI

struct GalleryView: View {
    @Binding var screenshotImage: UIImage?
    var body: some View {
        NavigationView{
            VStack(){
                HStack{
                    Text("Gallery 🖼️")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(25)
                    Spacer()
                }
                
                
                if let image = screenshotImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                }

                Spacer()

            }
            .background(Color(red: 245/255, green: 238/255, blue: 230/255))
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    GalleryView(screenshotImage: .constant(nil))
}
