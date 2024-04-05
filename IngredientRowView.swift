//
//  SwiftUIView.swift
//  
//
//  Created by JoyceMai on 2024/2/17.
//

import SwiftUI

struct IngredientRowView: View {
    @State private var editedServingSize = ""
    @State private var editedCalories = ""
    var ingredient: Ingredient
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(ingredient.name)
                Text(" \(ingredient.calories) kcal/100gr")
                    .foregroundColor(.gray)
            }
            .font(.title3)
            VStack {
                HStack{
                    TextField("Serving Size", text: $editedServingSize)
                    Text("gr")
                }
                HStack{
                    TextField("Calories",text: $editedCalories)
                    Text("kcal")
                }
                .onChange(of: editedServingSize) { newValue in
                    updateCalories()
                }
                
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
            .foregroundColor(.primary)
            .padding()
        }
    }
    func updateCalories(){
        if let servingSize = Int(editedServingSize) {
            let caloriesValue = (servingSize * ingredient.calories)/100
            editedCalories = "\(caloriesValue)"
        } else {
            editedCalories = ""
        }
    }
}
