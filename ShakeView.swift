//
//  SwiftUIView.swift
//  
//
//  Created by JoyceMai on 2024/2/22.
//

import SwiftUI
import CoreMotion
import UIKit

struct ShakeView: View {
    @State var progress: CGFloat = 0.5
    @State var startanimation: CGFloat = 0
    @State var isCongratsViewPresented = false
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("Shake your device")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        .padding(.top, 50)
                        .onShake {
                            progress+=0.1
                        }
                    Spacer()
                    //Wave
                    GeometryReader{proxy in
                        let size = proxy.size
                        //cup
                        TrapeziumShape(topWidth: 450, bottomWidth: 250, height:-325)
                            .offset(y:-70)
                            .foregroundColor(.white)
                        //WaterWave
                        //filled: progress = 2.5
                        WaterWave(progress: progress, waveHeight: 0.1, offset: startanimation)
                            .offset(y:380)
                            .fill(Color(red: 255/255, green: 187/255, blue: 100/255))
                            .mask{
                                TrapeziumShape(topWidth: 450, bottomWidth: 250, height:-325)
                                    .offset(y:-70)
                            }
                        
                        WaterWave(progress: progress, waveHeight: 0.1, offset: startanimation)
                            .offset(x:190, y:390)
                            .fill(Color(red: 255/255, green: 104/255, blue: 104/255)).opacity(0.8)

                            .mask{
                                TrapeziumShape(topWidth: 450, bottomWidth: 250, height:-325)
                                    .offset(y:-70)
                            }
                            .onAppear{
                                DispatchQueue.main.async{
                                    withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)){
                                        startanimation = size.width
                                    }
                                }
                            }
                    
                    
                    }
                    .frame(height:350)
                    Spacer()
                    Button("Next") {
                        isCongratsViewPresented.toggle()
                    }
                    .font(.title2)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 230/255, green: 164/255, blue: 180/255))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 245/255, green: 238/255, blue: 230/255))
                
                }
            
            }
        .fullScreenCover(isPresented: $isCongratsViewPresented) {
            CongratsView(isCongratsViewPresented: isCongratsViewPresented)
                    }
        .navigationViewStyle(StackNavigationViewStyle())
        }
    
    
}


struct WaterWave: Shape{
    var progress: CGFloat
    //Wave Height
    var waveHeight: CGFloat
    //Initial animation
    var offset: CGFloat
    
    //Enabling animation
    var animatableData: CGFloat{
        get{offset}
        set{offset = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to:.zero)
            let progressHeight: CGFloat = (1-progress) * rect.height
            let height = waveHeight * rect.height
            
            for value in stride(from: 0, to: rect.width, by: 2){
                
                let x: CGFloat = value
                let sine: CGFloat = sin(Angle(degrees:value + offset).radians)
                let y: CGFloat = progressHeight + (height * sine)
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
}

// The notification we'll send when a shake gesture happens.
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
    }
}

// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

// A View extension to make the modifier easier to use.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

#Preview {
    ShakeView()
}
