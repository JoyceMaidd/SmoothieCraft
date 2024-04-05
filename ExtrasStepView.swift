//
//  SwiftUIView.swift
//  
//
//  Created by JoyceMai on 2024/2/21.
//

import SwiftUI

struct ExtrasStepView: View {
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
                    Image(systemName: "plus").foregroundColor(Color.black).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/).bold().padding()
                }
                .actionSheet(isPresented: $isMenuPresented) {
                    ActionSheet(title: Text("Choose Ingredients"), buttons: [
                        .default(Text("🍫Chocolate"), action: { addIngredientAction("🍫Chocolate", 100, 580) }),
                        .default(Text("🫚Ginger"), action: { addIngredientAction("🫚Ginger", 100, 80) }),
                        .default(Text("🥚Protein powders"), action: { addIngredientAction("🥚Protein powders", 100, 400) }),
                        .default(Text("🥜Peanut"), action: { addIngredientAction("🥜Peanut", 100, 400) }),
                        .default(Text("🍯Honey"), action: { addIngredientAction("🍯Honey", 100, 300) }),
                        .default(Text("🍵Matcha powder"), action: { addIngredientAction("🍵Matcha powder", 100, 375) })
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

