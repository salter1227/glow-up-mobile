import SwiftUI

// MARK: - Grid Button Component
struct GridButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                Text(title)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
            .cornerRadius(15)
            .padding(8)
        }
    }
} 