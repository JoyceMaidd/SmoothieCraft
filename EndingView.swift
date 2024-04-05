
import SwiftUI


struct EndingView: View {
    @Binding var isEndingViewPresented: Bool
    @Binding var screenshotImage: UIImage?

    var body: some View {
        NavigationView{
            VStack {
                Spacer()

                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 243/255, green: 215/255, blue: 202/255))
                    .overlay(
                        VStack() {
                            Text("👏Awesome, you did it!")
                                .padding()
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                            
                            Spacer()
                            
                            Text("You've saved 30g CO2e! Check out your work in Gallery.")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()

                            NavigationLink(destination:GalleryView(screenshotImage: $screenshotImage)) {
                                Text("Go to Gallery🖼️")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding()
                                    .foregroundColor(Color.black)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 255/255, green: 248/255, blue: 227/255)))
                            }
                        }
                        .padding()
                    )
                    .background(BackgroundBlurView())
                    .padding(.vertical, 370)
                    .padding(.horizontal, 20)
                    

                Spacer()
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView(isEndingViewPresented: .constant(true), screenshotImage: .constant(nil))
    }
}
