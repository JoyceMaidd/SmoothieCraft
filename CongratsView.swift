import SwiftUI

struct CongratsView: View {
    @State var isCongratsViewPresented = false
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 243/255, green: 215/255, blue: 202/255))
                    .overlay(
                        VStack() {
                            Text("🥳Congratulations!")
                                .padding()
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                    
                            Spacer()
                            VStack(alignment: .leading, spacing:20){
                                Text("🎉Congrats! You've successfully crafted your own smoothie masterpiece.")
                                
                                Text("But wait, there's ONE MORE THING -- Get ready to be a smoothie artist!")
                                
                                Text("Design a colorful recipe for your drinks and let your creativity flow!")
                            }
                            
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            Spacer()
                           
                            NavigationLink(destination: DesignView()) {
                                Text("Start Designing🎨")
                                    .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.bold)
                                    .padding()
                                    .foregroundColor(Color.black)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 255/255, green: 248/255, blue: 227/255)))
                            }
                        }
                            .padding()
                    )
                    .padding(.vertical, 370)
                    .padding(.horizontal,20)
                    .background(BackgroundBlurView())

                Spacer()
            }
            
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}


