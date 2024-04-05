//
//  SwiftUIView.swift
//  
//
//  Created by JoyceMai on 2024/2/21.
//

import SwiftUI

struct FruitsStepView: View {
    var title: String
    @Binding var items: [Ingredient]
    var deleteItemAction: (IndexSet) -> Void
    var addIngredientAction: (String, Int, Int) -> Void
    @State private var isMenuPresented = false
    var body: some View {
        VStack (alignment:.leading){
            HStack {
                Text(title)
                    .font(.title2)
                    .bold()
                    .padding()
                Spacer()
                Button(action: {
                    isMenuPresented.toggle()
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(Color.black).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/).bold().padding()
                }
                .actionSheet(isPresented: $isMenuPresented) {
                    ActionSheet(title: Text("Choose Ingredients"), buttons: [
                        .default(Text("🍎Apples"), action: { addIngredientAction("🍎Apples", 100, 50) }),
                        .default(Text("🍐Pears"), action: { addIngredientAction("🍐Pears", 100, 60) }),
                        .default(Text("🍊Oranges"), action: { addIngredientAction("🍊Oranges", 100, 50) }),
                        .default(Text("🍋Lemons"), action: { addIngredientAction("🍋Lemons", 100, 20) }),
                        .default(Text("🍌Bananas"), action: { addIngredientAction("🍌Bananas", 100, 90) }),
                        .default(Text("🍉Watermelons"), action: { addIngredientAction("🍉Watermelons", 100, 30) }),
                        .default(Text("🍇Grapes"), action: { addIngredientAction("🍇Grapes", 100, 68) }),
                        .default(Text("🍓Strawberries"), action: { addIngredientAction("🍓Strawberries", 100, 32) }),
                        .default(Text("🫐Blueberries"), action: { addIngredientAction("🫐Blueberries", 100, 57) }),
                        .default(Text("🍈Melons"), action: { addIngredientAction("🍈Melons", 100, 30) }),
                        .default(Text("🍒Cherries"), action: { addIngredientAction("🍒Cherries", 100, 55) }),
                        .default(Text("🍑Peaches"), action: { addIngredientAction("🍑Peaches", 100, 40) }),
                        .default(Text("🥭Mangos"), action: { addIngredientAction("🥭Mangos", 100, 60) }),
                        .default(Text("🍍Pineapple"), action: { addIngredientAction("🍍Pineapple", 100, 50) }),
                        .default(Text("🥥Coconut"), action: { addIngredientAction("🥥Coconut", 100, 354) }),
                        .default(Text("🥝Kiwifruit"), action: { addIngredientAction("🥝Kiwifruit", 100, 60) }),
                        .default(Text("🍅Tomatoes"), action: { addIngredientAction("🍅Tomatoes", 100, 18) }),
                        .default(Text("🥑Avocados"), action: { addIngredientAction("🥑Avocados", 100, 160) })
                    ])
                }
            }
            .frame(maxWidth: .infinity)
            .background()
            List {
                ForEach(items) { ingredient in
                    IngredientRowView(ingredient: ingredient)
                }
                .onDelete(perform: deleteItemAction)
            }
            .listStyle(PlainListStyle())
        }
    }
    
    mutating func addIngredientAction(name: String, servingsize: Int, calories: Int) {
         let newIngredient = Ingredient(name: name, servingsize: servingsize, calories: calories)
         items.append(newIngredient)
     }

    mutating func deleteItemAction(at offsets: IndexSet) {
         items.remove(atOffsets: offsets)
     }
}

