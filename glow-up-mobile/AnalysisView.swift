import SwiftUI

struct AnalysisView: View {
    @Environment(\.dismiss) private var dismiss
    let image: UIImage
    @State private var faceShape: FaceShape?
    @State private var skinType: String?
    @State private var isAnalyzing = true
    @State private var errorMessage: String?
    @ObservedObject private var analysisData = AnalysisData.shared
    
    var faceShapeDescription: String {
        guard let faceShape = faceShape else { return "" }
        switch faceShape {
        case .round:
            return "A round face has equal width and length, with full cheeks and a soft jawline. There are no sharp angles, which gives a youthful and softer appearance."
        case .oval:
            return "An oval face is longer than it is wide, sometimes with a shorter forehead. The cheekbone width is typically wider than the forehead and jawline width. The hairline and chin are usually rounded and the facial features and contours are soft. This face shape is often considered to be the most beautiful because it is usually very symmetrical."
        case .square:
            return "The square face shape is characterised by an equally wide hairline and jawline. It typically also has long vertical contours that can be quite sharp and distinctive, and a square chin."
        case .heart:
            return "Heart-shaped faces typically have a wide forehead and delicate, narrow chin, like the point of a heart. People with this face shape will often have a pointed hairline."
        case .long:
            return "An oblong or rectangular face is longer than wide and has straight sides. The jawline is often rounded, and the overall look is long and narrow."
        }
    }
    
    var skinTypeDescription: String {
        guard let skinType = skinType else { return "" }
        switch skinType.lowercased() {
        case "normal":
            return "Normal is a term widely used to refer to well-balanced skin. The scientific term for well-balanced skin is eudermic. The T-zone (forehead, chin and nose) may be a bit oily, but overall sebum and moisture is balanced and the skin is neither too oily nor too dry. You likely have:\n• fine or barely visible pores\n• good blood circulation\n• a velvety, soft and smooth texture\n• no or few imperfections and blemishes\n• no severe sensitivity"
        case "dry":
            return "Dry skin is a condition characterised by a lack of adequate moisture and natural oils, leading to a rough, flaky, or scaly texture. Dry skin can vary in severity and appearance. Common signs of dry skin include tightness, especially after washing, visible fine lines and cracks, and a dull complexion. Generally, men are more likely to have oily skin due to higher sebum content and as skin ages, it tends to get drier, which can influence the appearance of wrinkles and lines."
        case "oily":
            return "'Oily' is used to describe a skin type with heightened sebum production. This over production is known as seborrhoea. Oily skin is a type of skin characterised by the overproduction of sebum, the skin's natural oil. It tends to have a shiny or greasy appearance, particularly in the T-zone (forehead, nose, and chin).\n\nOily skin is prone to enlarged pores, acne, and blackheads due to the excess oil, which can clog pores and trap dirt and bacteria.\nCommon among adolescents and those aged under 30 years old, oily skin can vary depending on the time of the year. Proper skincare, including cleansing and using products formulated for oily skin, can help manage oil production and minimise associated issues."
        default:
            return "Your skin type analysis is complete. Consider consulting with a dermatologist for personalized skincare recommendations."
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FAF7F6")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .cornerRadius(15)
                            .padding(.horizontal)
                        
                        if isAnalyzing {
                            ProgressView("Analyzing face and skin...")
                                .padding()
                        } else if let faceShape = faceShape, let skinType = skinType {
                            VStack(spacing: 24) {
                                // Face Shape Section
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Image(systemName: "face.smiling")
                                            .foregroundColor(Color(hex: "97C8E2"))
                                        Text("Face Shape Analysis")
                                            .font(.title2)
                                            .bold()
                                    }
                                    
                                    Text(faceShape.rawValue)
                                        .font(.title)
                                        .foregroundColor(Color(hex: "97C8E2"))
                                        .bold()
                                    
                                    Text(faceShapeDescription)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 2)
                                
                                Divider()
                                    .padding(.horizontal)
                                
                                // Skin Type Section
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Image(systemName: "drop.fill")
                                            .foregroundColor(Color(hex: "EDAFB8"))
                                        Text("Skin Type Analysis")
                                            .font(.title2)
                                            .bold()
                                    }
                                    
                                    Text(skinType.capitalized)
                                        .font(.title)
                                        .foregroundColor(Color(hex: "EDAFB8"))
                                        .bold()
                                    
                                    Text(skinTypeDescription)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 2)
                            }
                            .padding(.horizontal)
                        } else if let error = errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                        
                        Spacer(minLength: 50)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
            }
        }
        .task {
            do {
                let (shape, skin) = try FaceAnalysisService.shared.analyzeBoth(from: image)
                faceShape = shape
                skinType = skin
                // Store the results in shared data
                analysisData.updateAnalysis(faceShape: shape, skinType: skin)
            } catch {
                errorMessage = error.localizedDescription
            }
            isAnalyzing = false
        }
    }
} 