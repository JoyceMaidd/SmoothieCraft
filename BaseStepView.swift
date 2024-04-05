import SwiftUI


struct BaseStepView: View {
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
                        .foregroundColor(Color.black).font(.title2).bold().padding()
                }
                     .actionSheet(isPresented: $isMenuPresented) {
                     ActionSheet(title: Text("Choose Ingredients"), buttons: [
                     .default(Text("🥛Milk"), action: { addIngredientAction("🥛Milk", 100, 50) }),
                     .default(Text("💦Water"), action: { addIngredientAction("💦Water", 100, 0) }),
                     .default(Text("🥥Coconut milk"), action: { addIngredientAction("🥥Coconut milk", 100, 200) }),
                     .default(Text("🍦Yogurt"), action: { addIngredientAction("🍦Yogurt", 100, 50) }),
                     .default(Text("🍨Cream"), action: { addIngredientAction("🍨Cream", 100, 300) })
                     ])
                     }
                     }
            .frame(maxWidth: .infinity)
            .background()
            .padding(.top)
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
