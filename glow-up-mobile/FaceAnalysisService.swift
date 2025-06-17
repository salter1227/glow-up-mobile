import Vision
import CoreML
import UIKit

class FaceAnalysisService {
    static let shared = FaceAnalysisService()
    private let faceShapeModel: face_shape_model
    private let skinTypeModel: skin_type
    
    private init() {
        self.faceShapeModel = try! face_shape_model(configuration: MLModelConfiguration())
        self.skinTypeModel = try! skin_type(configuration: MLModelConfiguration())
    }
    
    func predictFaceShape(from image: UIImage) throws -> FaceShape {
        guard let pixelBuffer = image.pixelBuffer(width: 224, height: 224) else {
            throw NSError(domain: "FaceAnalysis", code: 4, userInfo: [NSLocalizedDescriptionKey: "Could not convert image to pixel buffer"])
        }
        let input = face_shape_modelInput(image: pixelBuffer)
        let prediction = try faceShapeModel.prediction(input: input)
        
        // Find the class with highest probability
        let highestProbability = prediction.targetProbability.max { $0.value < $1.value }
        let predictedClass = highestProbability?.key ?? "oval"
        
        return FaceShape(rawValue: predictedClass.capitalized) ?? .oval
    }
    
    func predictSkinType(from image: UIImage) throws -> String {
        guard let pixelBuffer = image.pixelBuffer(width: 224, height: 224) else {
            throw NSError(domain: "FaceAnalysis", code: 6, userInfo: [NSLocalizedDescriptionKey: "Could not convert image to pixel buffer"])
        }
        let input = skin_typeInput(image: pixelBuffer)
        let prediction = try skinTypeModel.prediction(input: input)
        
        // Find the class with highest probability
        let highestProbability = prediction.targetProbability.max { $0.value < $1.value }
        return highestProbability?.key ?? "unknown"
    }
    
    func analyzeBoth(from image: UIImage) throws -> (FaceShape, String) {
        let faceShape = try predictFaceShape(from: image)
        let skinType = try predictSkinType(from: image)
        return (faceShape, skinType)
    }
    
    // (Optional) Keep the Vision-based method for fallback or testing
    func analyzeFaceShape(from image: UIImage) async throws -> FaceShape {
        throw NSError(domain: "FaceAnalysis", code: 99, userInfo: [NSLocalizedDescriptionKey: "Vision-based analysis is now disabled. Use predictFaceShape instead."])
    }
} 