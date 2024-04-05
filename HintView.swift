//
//  SwiftUIView.swift
//
//
//  Created by JoyceMai on 2024/2/25.
//

import SwiftUI

struct HintView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            // Rounded rectangle design
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 243/255, green: 215/255, blue: 202/255))
                .overlay(
                    VStack(alignment: .leading) {
                        Spacer()
                        HStack {
                            Button(action: {
                               presentationMode.wrappedValue.dismiss()
                           }) {
                               Image(systemName: "xmark.circle.fill")
                                   .foregroundColor(.black)
                           }
                            Spacer()
                        }
                        //Mixed Berries and Banana Smoothie
                        VStack(alignment: .leading){
                            Text("Mixed Berries Smoothie")
                                .padding()
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                            VStack(alignment: .leading,spacing: 15){
                                Text("🥛Milk 250g")
                                Text("🍓Strawberries 60g")
                                Text("🫐Blueberries 20g")
                                Text("🍌Bananas 100g")
                                Text("🍯Honey")
                            }
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding(.horizontal)
                            .padding(.bottom, 40)
                        }
                        
                        
                        //Tropical Smoothie
                        VStack(alignment: .leading){
                            Text("Tropical Smoothie")
                                .padding()
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                            VStack(alignment: .leading,spacing: 15){
                                Text("🥥Coconut milk 250g")
                                Text("🍍Pineapples 150g")
                                Text("🍌Bananas 100g")
                                Text("🥭Mangos 120g")
                            }
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding(.horizontal)
                            .padding(.bottom, 40)
                        }
                        
                        //Green Smoothie
                        VStack(alignment: .leading){
                            Text("Green Smoothie")
                                .padding()
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                            VStack(alignment: .leading,spacing: 15){
                                Text("🍦Yogurt 250g")
                                Text("🥑Avocados 77g")
                                Text("🍌Bananas 100g")
                                Text("🥬Spinach 180g")
                                //Text("🍯Honey")
                            }
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding(.horizontal)
                            .padding(.bottom, 40)
                        }
                        Spacer()
                    }
                    .padding()
                )
                .padding(100)
            
            Spacer()
        }
        
    }
}

#Preview {
   HintView()
}
