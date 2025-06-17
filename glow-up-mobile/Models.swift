import SwiftUI

// MARK: - Face Shape Enum
enum FaceShape: String {
    case oval = "Oval"
    case round = "Round"
    case square = "Square"
    case heart = "Heart"
    case long = "Long"
    
    var description: String {
        switch self {
        case .oval:
            return "Oval face shape is characterized by balanced proportions and slightly rounded jawline."
        case .round:
            return "Round face shape has full cheeks and a rounded jawline with similar width and length."
        case .square:
            return "Square face shape has a strong jawline and forehead with similar width."
        case .heart:
            return "Heart face shape has a wider forehead and narrower jawline, often with a pointed chin."
        case .long:
            return "Long face shape has an elongated appearance with high cheekbones."
        }
    }
} 