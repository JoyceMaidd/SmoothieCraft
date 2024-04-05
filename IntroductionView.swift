//
//  SwiftUIView.swift
//  
//
//  Created by JoyceMai on 2024/2/25.
//

import SwiftUI

struct IntroductionView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            // Rounded rectangle design
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 243/255, green: 215/255, blue: 202/255))
                .overlay(
                    VStack(alignment: .leading) {
                        HStack {
                            Button(action: {
                               presentationMode.wrappedValue.dismiss()
                           }) {
                               Image(systemName: "xmark.circle.fill")
                                   .foregroundColor(.black)
                                   .padding()
                           }
                        }
                        Text("Welcome to SmoothieCraft!🥤")
                            .padding()
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        VStack(alignment: .leading){
                            Text("Crafting Healthy, Creative, and Eco-Friendly Smoothies")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .padding(.horizontal)
                                .padding(.bottom, 40)
                            
                            VStack(alignment:.leading, spacing: 30){
                                Text("Do you know that an estimated 500 BILLION plastic disposable cups are used every year around the world and thrown away almost immediately after usage?🤔")
                                Text("It is time to make some changes. You can make a positive impact by creating your own smoothies at home!")
                                Text("Unleash your creativity by crafting delicious and nutritious smoothies with SmoothieCraft🥤.By making one cup of smoothie at home, you can save up to 30g of CO2e🍀.")
                                Text("By simply choosing your base🥛, fruits🍎, veggies🥗, and extras🍫, and specifying the serving size, you can blend and craft your smoothie!")
                            }
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .padding()
                            
                            Spacer()
                            Text("Don't know what to build? Here's some inspiration for you. →")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .padding()
                           
                        }
                        
                    }
                        .padding()
                )
                .padding(100)
            
            Spacer()
        }
        
    }
}

#Preview {
   IntroductionView()
}
