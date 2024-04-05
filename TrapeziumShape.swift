import SwiftUI

struct TrapeziumShape: Shape {
    var topWidth: CGFloat
    var bottomWidth: CGFloat
    var height: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Define the four points of the trapezium
        let topLeading = CGPoint(x: (rect.width - topWidth) / 2, y: rect.minY)
        let topTrailing = CGPoint(x: topLeading.x + topWidth, y: rect.minY)
        let bottomTrailing = CGPoint(x: (rect.width - bottomWidth) / 2 + bottomWidth, y: rect.maxY - height)
        let bottomLeading = CGPoint(x: (rect.width - bottomWidth) / 2, y: rect.maxY - height)

        // Move to the starting point
        path.move(to: topLeading)

        // Draw lines to form the trapezium
        path.addLine(to: topTrailing)
        path.addLine(to: bottomTrailing)
        path.addLine(to: bottomLeading)

        // Close the path
        path.closeSubpath()

        return path
    }
}

struct TrapeziumView: View {
    var body: some View {
        TrapeziumShape(topWidth: 300, bottomWidth: 400, height: 700)
            .fill(Color.blue)
            .frame(width: 200, height: 150)
    }
}

struct TrapeziumView_Previews: PreviewProvider {
    static var previews: some View {
        TrapeziumView()
    }
}
