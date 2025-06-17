import SwiftUI

// MARK: - Makeup & Glasses View
struct MakeupGlassesView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var analysisData = AnalysisData.shared
    
    var glassesRecommendation: String {
        guard let faceShape = analysisData.faceShape else { return "" }
        switch faceShape {
        case .round:
            return "You have a round face, therefore rectangle glasses are highly recommended as they give round faces some contour, making the face look narrower and adding definition and structure. Avoid round or oval glasses as they will only make your face look rounder. Semi-rimless or full rimmed frames are also recommended as they will create a contrast to the natural curves of your face."
        case .oval:
            return "You have an oval face meaning that you will suit almost any frame shape, round, angular or bold, you name it! However it's best to avoid narrow frames as they lenthen the face visually and make it look longer, try oversized or aviator frames instead."
        case .heart:
            return "You have a heart face so round and cat-eye frames that are semi-rim/rimless will most likely flatter you the most. Square and aviator glasses can also bring a softness and balance to your angular face. Avoid any bright colours and wide frames are they underline the heart shape and can appear unflattering."
        case .long:
            return "You have an oblong face so luckily you can suit the majority of glasses. Square frames in particular will likely flatter you as they add width and structure to provide contrast to your longer face. Cat-eye frames will also suit you due to their wide frames and playful style. Aim for decorative details with bold and colourful frames to help break up the length of your face, making it seem more balanced. Avoid narrow and rectangular frame shapes as they will make your face appear longer."
        case .square:
            return "You have a square face, so round and oval frames will help soften your angular features. Cat-eye frames can also add a feminine touch and balance to your strong jawline. Avoid square or rectangular frames as they will emphasize the angularity of your face."
        }
    }
    
    var makeupRecommendation: String {
        guard let faceShape = analysisData.faceShape else { return "" }
        switch faceShape {
        case .oval:
            return "Oval faces tend not to need much help with balance or structure, so most make up techniques will work! Concentrate on one specific feature (eyes vs. lips) while keeping the other simple. Oval face shapes can pull off more looks than some others. However, balance is key. Be careful not to go too dramatic on any one part of your face.\n\n**Contour:** If you wish to reduce their forehead length then apply a bronzer working from the temples down to the center of your face, and lightly brush over your cheekbones.\n\n**Blush:** You can use blush to widen the face and accentuate the cheekbones, making them look slightly more sculpted and adding a healthy color to the midface. Use a light touch of blush, blending from the temples down to the apples of the cheeks, focusing on the cheekbones.\n\n**Highlight:** To highlight the high points of your face, you can use a fan brush or a cream-based highlighter stick if you are in a rush to highlight your cheekbones, chin, Cupid's Bow, bridge of the nose, and under the brow bone.\n\n**Eye:** A great way to add width to the midface is by using winged liner or cat-eye eyeliner. Extending your liner just past the corners of your eyes can give the illusion of a slightly wider look. You can accentuate the shape of your eyes by applying a light-colored eyeshadow and then blending a darker color into the crease.\n\n**Brows:** Softly-angled brows can help balance facial features and give more shape.\n\n**Lips:** Line your lips before applying gloss or lipstick to better define the chin area."
        case .long:
            return "**Contour:** Contouring can be useful to emphasize the cheeks by placing a bronzer in the hollows of your cheekbones but avoid contouring around the jaw area.\n\n**Blush:** Swirl blush just above the apples of your cheeks in circular motions to give them fullness.\n\n**Highlight:** Apply highlighter to the tops of the cheekbones, blending back towards the temples and under the brow bone. You can also add it to the tip of the nose and Cupid's Bow but avoid placing highlighter on the forehead and chin, as this can make your face appear longer.\n\n**Eye:** Have as much fun as you want with your eyes: apply cat-eye eyeliner, brightly colored shadow, and fun false lashes.\n\n**Brows:** Long, flat brows help add width to the face.\n\n**Lips:** Skip the lip liner and bright lip colors. Keep the lips a subtle shade of pink."
        case .heart:
            return "**Contour:** Apply bronzer or contour to the top of your forehead, blending down to the temples and underneath the cheekbones to emphasize your cheekbones more. You can also use a bronzer beneath under your chin to contour.\n\n**Blush:** Smile and apply a matte blush on the apples of the cheek, blending towards your ear/hairline. This will help accentuate your cheeks.\n\n**Highlight:** Apply a highlighter to the high points of your cheekbones, where the light would naturally hit. You can also use highlighter underneath your brow bone, on your Cupid's Bow (the curve on your upper lip), and the bridge of your nose.\n\n**Eye:** For eyes, stick with soft lines and subtle liner.\n\n**Brows:** Rounded brows can help soften your face.\n\n**Lips:** Add a pop of color to the lips to draw some attention from your strong cheekbones towards the lips. Soft/sheer pinks or reds are recommended."
        case .round:
            return "Round faces are very youthful but can lack structure.\n\n**Contour:** Contouring round faces is all about creating the illusion of structure without going overboard. Choose a matte bronzer that is one or two shades darker than your skin tone and apply it in the hollows of your cheeks, sweeping from just below your ear towards the corner of your mouth. Blend well so there are no harsh lines. A tiny swipe on the sides of your forehead near your hairline also helps to slim the face visually.\n\n**Blush:** Smile and apply blush slightly above the apples and blend upwards towards your temples to help break up the roundness. This upward motion gives a natural lift. Cream blush formulas work brilliantly because they melt into the skin and give a fresh, dewy finish rather than a powder that can settle into unwanted lines.\n\n**Highlight:** Strategic highlighting brings attention to the centre of your face and draws the eye upwards, so it's a beauty trick you won't want to miss. Highlight on the bridge of the nose, center of the forehead, high points of the cheeks, underneath the brow bone, Cupid's bow, and on the chin to give the illusion of more shape. A subtle strobe cream works well under natural light. Avoid highlighting your chin too much since that might make your face appear fuller instead of sculpted.\n\n**Eye:** Eyes are the star attraction, so make them pop with softly winged eyeliner and defined lashes. Extend your wing slightly upwards to create the appearance of lifted eyes and a longer face. Matte neutral shadows work best on the lid, and smoky eyes are great for adding a focal point and definition to the face.\n\n**Brows:** Aim for a soft arch rather than a dramatic peak to keep your look natural yet defined. The raised arch subtly lengthens your face and keeps everything looking freshly framed.\n\n**Lips:** A bold lip can anchor your face and draw attention away from fullness in the cheeks. Rich berry, mauve or classic red shades all work wonders. Apply your chosen lipstick with a fine brush to keep edges crisp. For an easy everyday look, try a tinted lip balm—hydrating, low‑maintenance and still enough to shift the focus to your mouth rather than those round cheeks."
        case .square:
            return "Square faces should be treated much the same as rectangular ones. Soft and ethereal makeup looks help to soften angular features.\n\n**Contour:** When applying contour to the jawline, use a fluffy brush and brush upward for a natural look, gently blending towards the center of your forehead.\n\n**Blush:** Use a fluffy brush to sweep a light layer of bronzer upwards over the hollows of your cheekbones and apply blush to your cheeks. This can help soften the edges of your face. Rosy cream blushes can add the perfect flush to your cheeks.\n\n**Highlight:** You may like to elongate the face by applying highlighter to your cheekbones, chin and the center of your forehead.\n\n**Eye:** People with square faces may also want to focus on their lashes, accompanied by a light-colored eyeshadow. Apply a thickening, lengthening mascara.\n\n**Brows:** Thick brows with a soft arch will draw attention to eyes.\n\n**Lips:** Because your lower face is prominent, soft nude and pink lip colors will help draw attention to your lips. Line your lips before applying gloss or lipstick to better define the area."
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FAF7F6")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 12) {
                            Image(systemName: "eyeglasses")
                                .font(.system(size: 60))
                                .foregroundColor(Color(hex: "EAD69E"))
                            
                            Text("Makeup & Glasses")
                                .font(.largeTitle)
                                .bold()
                            
                            Text("Personalized recommendations based on your face shape")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        
                        if analysisData.hasAnalysis, let faceShape = analysisData.faceShape {
                            // User has scanned - show personalized recommendations
                            VStack(spacing: 20) {
                                // Face Shape Summary
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Image(systemName: "face.smiling")
                                            .foregroundColor(Color(hex: "97C8E2"))
                                        Text("Your Face Shape")
                                            .font(.title2)
                                            .bold()
                                    }
                                    
                                    Text(faceShape.rawValue)
                                        .font(.title)
                                        .foregroundColor(Color(hex: "97C8E2"))
                                        .bold()
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 2)
                                
                                // Glasses Recommendations
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Image(systemName: "eyeglasses")
                                            .foregroundColor(Color(hex: "EAD69E"))
                                        Text("Glasses Recommendations")
                                            .font(.title2)
                                            .bold()
                                    }
                                    
                                    Text(glassesRecommendation)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                        .lineSpacing(4)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 2)
                                
                                // Makeup Recommendations
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Image(systemName: "paintbrush.fill")
                                            .foregroundColor(Color(hex: "EDAFB8"))
                                        Text("Makeup Recommendations")
                                            .font(.title2)
                                            .bold()
                                    }
                                    
                                    Text(makeupRecommendation)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                        .lineSpacing(4)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 2)
                            }
                            .padding(.horizontal)
                        } else {
                            // User hasn't scanned - prompt to scan
                            VStack(spacing: 20) {
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 80))
                                    .foregroundColor(Color(hex: "97C8E2"))
                                    .padding()
                                
                                Text("Scan Your Face First")
                                    .font(.title)
                                    .bold()
                                
                                Text("To receive personalized makeup and glasses recommendations, please scan your face using the camera or upload a photo from your library.")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Button(action: {
                                    dismiss()
                                }) {
                                    Text("Go Back & Scan")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color(hex: "97C8E2"))
                                        .cornerRadius(15)
                                }
                                .padding(.horizontal)
                            }
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
    }
}

// MARK: - Hairstyle View
struct HairstyleView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FAF7F6")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Hairstyle")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Text("Coming Soon!")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Spacer()
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
    }
}

// MARK: - Skincare View
struct SkincareView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var analysisData = AnalysisData.shared
    
    var skincareRecommendation: String {
        guard let skinType = analysisData.skinType else { return "" }
        switch skinType.lowercased() {
        case "dry":
            return "You likely have dry skin which is based on your genetics and is something you'll generally have throughout your life. It can vary depending on things like the weather, hormones, ageing and stress. As a skin type that produces fewer natural oils than others, people who have dry skin will experience things like dullness, itching, flaking and potentially more visible fine lines and wrinkles. This can be especially noticeable in winter, when the combination of cold, dry air and toasty central heating can dry your skin out even more.\n\nSome of the main characteristics of dry skin include:\n• Feeling tight or itchy\n• Rough texture\n• Flaky patches\n• A lack of radiance\n• More visible fine lines and wrinkles\n\nThe best skin care regimen for dry skin is one loaded with hydrating ingredients that replenish and lock in moisture. Alongside your daily skincare steps, a few times a week it'll also really help to treat your skin to a face mask.\n\nGlycerine, Hyaluronic Acid, Vitamin E, Vitamin B5 and Ceramides are all some of the most buzz-worthy ingredients right now to quench thirsty skin. Use your fingertips to gently rub your face instead of using a more abrasive sponge or washcloth. Don't scrub the skin on your face, as this can cause irritation.\n\nWhen selecting a face wash, avoid soaps and cleansers that contain harsh ingredients, like:\n• alcohol\n• retinoids\n• alpha hydroxy acids\n• sulfates\n• fragrance\n\nThese ingredients may dry your skin and cause irritation or inflammation.\n\nTo keep facial skin hydrated, use a gentle cleanser, wear sunscreen daily, and always apply the right moisturizing lotion and other skin care products for your skin. If these practices don't work, it may be a sign of a medical condition."
        case "oily":
            return "Although oily skin can clog pores and lead to increased acne breakouts, oily skin also has many benefits. Oil helps preserve the skin, and people with oily skin tend to have thicker skin and fewer wrinkles. The key is to strike a balance between having too much oil and maintaining your skin's natural moisture.\n\nTo help control oily skin, we recommend the following tips:\n\nWe recommend cleansing your face up to twice a day and after sweating. When washing, avoid scrubbing your skin as it can irritate your skin. When choosing skin care products, look for those that are labelled as \"oil free\" and \"noncomedogenic.\" This means these products won't clog your pores or cause acne.\n\nIngredients like salicylic acid, glycolic acid, and lactic acid can help reduce oiliness, but they may be too harsh for your skin so if they cause any irritation, stop using the product. Aim to use a gentle, foaming face wash as using a face wash that is too harsh can irritate your skin and trigger increased oil production. Instead, look for a mild, gentle face wash.\n\nAfter cleansing, use a moisturizer. Although you have oily skin, it is still important to apply moisturizer to keep your skin hydrated. To save time and protect your skin from the sun's harmful ultraviolet rays, look for a moisturizer that also contains a broad-spectrum sunscreen with an SPF of 30 or higher.\n\nWhen outdoors, use sunscreen as it helps prevent sun damage that could lead to wrinkles, age spots, and even skin cancer. To prevent acne breakouts, look for sunscreens that contain zinc oxide and titanium dioxide, and do not use sunscreens that contain fragrance or oils. Seek shade and wear sun-protective clothing, like a wide-brimmed hat, for additional protection.\n\nDo not use oil-based or alcohol-based cleansers as these can irritate your skin. Avoid touching your face throughout the day. Although it's tempting to touch your face, doing so can spread dirt, oil, and bacteria from your hands to your face. Only touch your face when you're cleansing, moisturizing, or applying sunscreen or makeup, and make sure your hands are clean first."
        case "normal":
            return "You have normal skin which is often considered the most balanced of all the skin types. It's neither too oily nor too dry, has a robust outermost layer, and a smooth and even texture. Although it's the most balanced, you can still benefit from a consistent skin care routine.\n\nIt's recommended to follow the basics:\n• Cleanse twice a day with a gentle, nonfoaming cleanser.\n• Moisturize with a light, hydrating moisturizer (recommended to use one with hyaluronic acid).\n• Protect your skin from sun damage with an SPF of 30 or more.\n• As a bonus step, you can treat the skin with a serum to brighten, hydrate, or smooth.\n\nLess is more when it comes to creating a skin care routine for normal skin. Avoid products that strip the skin as this will encourage it to produce more sebum. Similarly, overmoisturizing can prevent the skin from producing its own natural moisturizing factors.\n\nIf you suffer from acne, try the following:\n• Spot treat your breakouts with salicylic acid or benzoyl peroxide.\n• Avoid overexfoliating. Remember, gentle cleansing is key.\n• Swap heavier moisturizers for lighter, oil-free options.\n• Avoid products containing alcohol."
        default:
            return "Your skin type analysis is complete. Consider consulting with a dermatologist for personalized skincare recommendations tailored to your specific skin type."
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FAF7F6")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 12) {
                            Image(systemName: "drop.fill")
                                .font(.system(size: 60))
                                .foregroundColor(Color(hex: "B0C4B1"))
                            
                            Text("Skincare")
                                .font(.largeTitle)
                                .bold()
                            
                            Text("Personalized skincare recommendations based on your skin type")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        
                        if analysisData.hasAnalysis, let skinType = analysisData.skinType {
                            // User has scanned - show personalized recommendations
                            VStack(spacing: 20) {
                                // Skin Type Summary
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Image(systemName: "drop.fill")
                                            .foregroundColor(Color(hex: "EDAFB8"))
                                        Text("Your Skin Type")
                                            .font(.title2)
                                            .bold()
                                    }
                                    
                                    Text(skinType.capitalized)
                                        .font(.title)
                                        .foregroundColor(Color(hex: "EDAFB8"))
                                        .bold()
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 2)
                                
                                // Skincare Recommendations
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Image(systemName: "sparkles")
                                            .foregroundColor(Color(hex: "B0C4B1"))
                                        Text("Skincare Recommendations")
                                            .font(.title2)
                                            .bold()
                                    }
                                    
                                    Text(skincareRecommendation)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                        .lineSpacing(4)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 2)
                                
                                // Additional Tips Section
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Image(systemName: "lightbulb.fill")
                                            .foregroundColor(Color(hex: "EAD69E"))
                                        Text("Additional Tips")
                                            .font(.title2)
                                            .bold()
                                    }
                                    
                                    Text("Remember to always patch test new products before applying them to your entire face. Start with a small amount on your inner arm or behind your ear to check for any allergic reactions. Consistency is key - stick to your routine for at least 4-6 weeks to see results.")
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                        .lineSpacing(4)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 2)
                            }
                            .padding(.horizontal)
                        } else {
                            // User hasn't scanned - prompt to scan
                            VStack(spacing: 20) {
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 80))
                                    .foregroundColor(Color(hex: "B0C4B1"))
                                    .padding()
                                
                                Text("Scan Your Face First")
                                    .font(.title)
                                    .bold()
                                
                                Text("To receive personalized skincare recommendations, please scan your face using the camera or upload a photo from your library.")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Button(action: {
                                    dismiss()
                                }) {
                                    Text("Go Back & Scan")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color(hex: "B0C4B1"))
                                        .cornerRadius(15)
                                }
                                .padding(.horizontal)
                            }
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
    }
}

// MARK: - Clothing View
struct ClothingView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FAF7F6")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Clothing")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Text("Coming Soon!")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Spacer()
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
    }
} 