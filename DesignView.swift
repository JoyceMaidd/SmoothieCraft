//
//  SwiftUIView.swift
//  
//
//  Created by JoyceMai on 2024/2/23.
//
import PencilKit
import SwiftUI

class ViewController: UIViewController {
    
    private let ViewController: PKCanvasView = {
        let canvas = PKCanvasView()
        canvas.drawingPolicy = .anyInput
        return canvas
    }()
    let drawing = PKDrawing()
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.drawing = drawing
        view.addSubview(ViewController)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ViewController.frame = view.bounds
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let toolpicker = PKToolPicker()
        toolpicker.setVisible(true, forFirstResponder: ViewController)
        toolpicker.addObserver(ViewController)
        ViewController.becomeFirstResponder()
    }
    
    }

struct CanvasViewControllerWrapper: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ViewController
    

    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Update the view controller if needed
    }
}


struct DesignView: View {
    @State private var screenshotImage: UIImage?
    @State private var isEndingViewPresented = false
    var body: some View {
        NavigationView{
            ZStack{
                CanvasViewControllerWrapper()
                VStack{
                HStack {
                    Spacer()
                    Button(action: {
                        takeScreenshot()
                    }) {
                        Text("Save")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color(red: 230/255, green: 164/255, blue: 180/255))
                    }
                    .padding(20)
                    .fullScreenCover(isPresented: $isEndingViewPresented) {
                        EndingView(isEndingViewPresented: $isEndingViewPresented, screenshotImage: $screenshotImage)
                    }
                }
                Spacer()
                VStack{
                    Text("Smoothie Recipe Card")
                        .foregroundColor(.white)
                        .font(.largeTitle).bold()
                        .frame(width: 500,height: 100)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 230/255, green: 164/255, blue: 180/255))).padding(60)
                    Spacer()
                    GeometryReader { proxy in
                        let size = proxy.size
                        Path { path in
                            path.addPath(TrapeziumShape(topWidth: 400, bottomWidth: 220, height: -260).path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height)))
                        }
                        .offset(y: -350)
                        .stroke(Color.gray, lineWidth: 5)
                    }
                    .frame(height: 350)
                    
                }
            }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    func takeScreenshot() {
            let hostingController = UIHostingController(rootView: DesignView())
            let renderer = UIGraphicsImageRenderer(size: UIScreen.main.bounds.size)
        
            let screenshotImage = renderer.image { _ in
                hostingController.view.drawHierarchy(in: UIScreen.main.bounds, afterScreenUpdates: true)
            }

            self.screenshotImage = screenshotImage
            isEndingViewPresented = true
        }
}

#Preview {
    DesignView()
}
