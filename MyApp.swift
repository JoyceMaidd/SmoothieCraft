import SwiftUI

@main
struct MyApp: App {
    private var userData = UserData()
    var body: some Scene {
        WindowGroup {
            SmoothieView()
                .environmentObject(userData)
        }
    }
}
