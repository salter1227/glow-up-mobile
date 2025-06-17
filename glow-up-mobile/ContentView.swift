//
//  ContentView.swift
//  glow-up-mobile
//
//  Created by Lucy Salter on 17/06/2025.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    @State private var showingCamera = false
    @State private var showingAnalysis = false
    @State private var showingMakeupGlasses = false
    @State private var showingHairstyle = false
    @State private var showingSkincare = false
    @State private var showingClothing = false
    
    var body: some View {
        ZStack {
            Color(hex: "FAF7F6")
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Text("Home")
                    .font(Font.system(size: 48).bold())
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.horizontal, 24)
                
                Grid(horizontalSpacing: 1, verticalSpacing: 1) {
                    GridRow {
                        GridButton(
                            title: "Makeup & Glasses",
                            icon: "eyeglasses",
                            color: Color(hex: "EAD69E")
                        ) {
                            showingMakeupGlasses = true
                        }
                        
                        GridButton(
                            title: "Hairstyle",
                            icon: "scissors",
                            color: Color(hex: "EDAFB8")
                        ) {
                            showingHairstyle = true
                        }
                    }
                    
                    GridRow {
                        GridButton(
                            title: "Skincare",
                            icon: "drop.fill",
                            color: Color(hex: "B0C4B1")
                        ) {
                            showingSkincare = true
                        }
                        
                        GridButton(
                            title: "Clothing",
                            icon: "tshirt.fill",
                            color: Color(hex: "97C8E2")
                        ) {
                            showingClothing = true
                        }
                    }
                }
                .padding(.horizontal, 24)
                
                VStack(spacing: 16) {
                    Button(action: {
                        showingCamera = true
                    }) {
                        Text("Scan")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "97C8E2"))
                            .cornerRadius(15)
                    }
                    
                    PhotosPicker(selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        Text("Library")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "EDAFB8"))
                            .cornerRadius(15)
                    }
                }
                .padding(.horizontal, 24)
                
                Spacer()
            }
        }
        .sheet(isPresented: $showingCamera) {
            CameraView(image: $selectedImage)
        }
        .fullScreenCover(isPresented: $showingAnalysis) {
            if let image = selectedImage {
                AnalysisView(image: image)
            }
        }
        .fullScreenCover(isPresented: $showingMakeupGlasses) {
            MakeupGlassesView()
        }
        .fullScreenCover(isPresented: $showingHairstyle) {
            HairstyleView()
        }
        .fullScreenCover(isPresented: $showingSkincare) {
            SkincareView()
        }
        .fullScreenCover(isPresented: $showingClothing) {
            ClothingView()
        }
        .onChange(of: selectedImage) { newImage in
            if newImage != nil {
                showingAnalysis = true
            }
        }
        .onChange(of: selectedItem) { newItem in
            if let newItem = newItem {
                Task {
                    if let data = try? await newItem.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        selectedImage = image
                        showingAnalysis = true
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
