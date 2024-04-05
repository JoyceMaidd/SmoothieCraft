//
//  SwiftUIView.swift
//  
//
//  Created by JoyceMai on 2024/2/15.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var userData: UserData
    @State private var baseingredient: [Ingredient] = []
    @State private var fruitsingredient: [Ingredient] = []
    @State private var veggiesingredient: [Ingredient] = []
    @State private var extrasingredient: [Ingredient] = []
    @State private var isAboutViewPresented = false
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HStack{
                    Text("Build your own smoothie!🥤")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(25)
                    Spacer()
                    Text("About")
                        .font(.body)
                        .fontWeight(.bold)
                        .opacity(0.7)
                    Button(action: {
                        isAboutViewPresented.toggle()
                    }) {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .bold()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                            .opacity(0.7)
                    }
                    .padding(.trailing, 20)
                    .fullScreenCover(isPresented: $isAboutViewPresented) {
                        AboutView()
                    }
                }
                
                
                BaseStepView(
                    title: "Step 1: Choose your Base🥛",
                    items: $baseingredient,
                    deleteItemAction: { indices in
                        deleteBaseItem(at: indices)},
                    addIngredientAction: { name, servingsize, calories in
                        addBaseIngredient(name: name, servingsize: servingsize, calories: calories)
                    }
                )
                
                FruitsStepView(
                    title: "Step 2: Choose your Fruits 🍎",
                    items: $fruitsingredient,
                    deleteItemAction: { indices in
                        deleteFruitItem(at: indices)},
                    addIngredientAction: { name, servingsize, calories in
                        addFruitIngredient(name: name, servingsize: servingsize, calories: calories)
                    }
                )
                
                VeggiesStepView(
                    title: "Step 3: Choose your Veggies 🥗",
                    items: $veggiesingredient,
                    deleteItemAction: { indices in
                        deleteVeggiesItem(at: indices)},
                    addIngredientAction: { name, servingsize, calories in
                        addVeggiesIngredient(name: name, servingsize: servingsize, calories: calories)
                    }
                )
                
                ExtrasStepView(
                    title: "Step 4: Choose your Extras 🍫",
                    items: $extrasingredient,
                    deleteItemAction: { indices in
                        deleteExtraItem(at: indices)},
                    addIngredientAction: { name, servingsize, calories in
                        addExtraIngredient(name: name, servingsize: servingsize, calories: calories)
                    }
                )
                HStack{
                    Spacer()
                    VStack(alignment:.trailing){
                        NavigationLink(destination: ShakeView()){
                            Text("Start Blending")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding()
                                .foregroundColor(Color.black)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        }
                    }
                    .font(.title2)
                }
                .padding(30)
            }
            .background(Color(red: 245/255, green: 238/255, blue: 230/255))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(userData) 
        
    }
    
    
    
    func addBaseIngredient(name: String, servingsize: Int, calories: Int) {
            let newIngredient = Ingredient(name: name, servingsize: servingsize, calories: calories)
            baseingredient.append(newIngredient)
        }

        func deleteBaseItem(at indices: IndexSet) {
            baseingredient.remove(atOffsets: indices)
        }
    
    func addFruitIngredient(name: String, servingsize: Int, calories: Int) {
            let newIngredient = Ingredient(name: name, servingsize: servingsize, calories: calories)
            fruitsingredient.append(newIngredient)
        }

        func deleteFruitItem(at indices: IndexSet) {
            fruitsingredient.remove(atOffsets: indices)
        }
    
    func addVeggiesIngredient(name: String, servingsize: Int, calories: Int) {
            let newIngredient = Ingredient(name: name, servingsize: servingsize, calories: calories)
            veggiesingredient.append(newIngredient)
        }

        func deleteVeggiesItem(at indices: IndexSet) {
            veggiesingredient.remove(atOffsets: indices)
        }
    
    func addExtraIngredient(name: String, servingsize: Int, calories: Int) {
            let newIngredient = Ingredient(name: name, servingsize: servingsize, calories: calories)
            extrasingredient.append(newIngredient)
        }

        func deleteExtraItem(at indices: IndexSet) {
            extrasingredient.remove(atOffsets: indices)
        }
}

#Preview {
   
        HomeView()
    
}
