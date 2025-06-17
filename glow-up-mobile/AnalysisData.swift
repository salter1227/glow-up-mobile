import SwiftUI

// MARK: - Shared Data Model
class AnalysisData: ObservableObject {
    @Published var faceShape: FaceShape?
    @Published var skinType: String?
    @Published var hasAnalysis: Bool = false
    
    static let shared = AnalysisData()
    
    private init() {}
    
    func updateAnalysis(faceShape: FaceShape, skinType: String) {
        self.faceShape = faceShape
        self.skinType = skinType
        self.hasAnalysis = true
    }
    
    func clearAnalysis() {
        self.faceShape = nil
        self.skinType = nil
        self.hasAnalysis = false
    }
} 