//
//  ContentView.swift
//  First
//
//  Created by Denis Yaremenko on 03.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    
    // MARK: - Body
    
    
    var body: some View {
        ScrollView { // Wrapping VStack in ScrollView
            VStack {
                Text("--Titles--")
                Text("Hello, world!")
                
                // Basic gradient text
                Text("Teal Gradient")
                    .font(.system(size: 30))
                    .fontWeight(.black)
                    .foregroundStyle(.teal.gradient)
                
                // Basic gradient text
                Text("Linear Gradient")
                    .font(.system(size: 30))
                    .fontWeight(.black)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.pink, .purple, .orange, .blue, .yellow],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                
                Text("--Images--")
                
                // MARK: - 1. Basic
                //                AsyncImage(url: URL(string: imageURL))
                
                // MARK: - 2. Scale
                //                AsyncImage(url: URL(string: imageURL), scale: 4.0)
                
                // MARK: - 3. Placeholder
                //                AsyncImage(url: URL(string: imageURL)) { image in
                //                    image
                //                        .imageModifier()
                //                } placeholder: {
                //                    Image(systemName: "photo.circle.fill")
                //                        .iconModifier()
                //                }
                //                .padding(40)
                
                // MARK: - Phase
                /*
                 AsyncImage(url: URL(string: imageURL)) { phase in
                 // Success: the image was successfully loaded
                 // Failure: the image failed to load with an error
                 // Empty: No image is loaded
                 
                 if let image = phase.image {
                 image.imageModifier()
                 } else if phase.error != nil {
                 Image.init(systemName: "ant.circle.fill").iconModifier()
                 } else { // like placeholder
                 Image(systemName: "photo.circle.fill").iconModifier()
                 }
                 }
                 .padding(40)
                 */
                
                // MARK: - 5. Animation
                AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                    switch phase {
                    case .success(let image):
                        image.imageModifier()
//                            .transition(.move(edge: .bottom))
                            .transition(.slide)
                        
                        
                    case .failure(_):
                        Image(systemName: "ant.circle.fill").iconModifier()
                        
                    case .empty:
                        Image(systemName: "photo.circle.fill").iconModifier()
                    @unknown default:
                        ProgressView()
                    }
                }
                .padding(40)
                
                
                
                
                
                Text("--Links--")
                Link("Go to hell.com", destination: URL(string: "https://apple.com")!)
                    .buttonStyle(.borderless)
                
                Link("Go to hell.com", destination: URL(string: "tel:1234567890")!)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.regular)
                
                Link("Go to hell.com", destination: URL(string: "mailto:swiftui@apple.com")!)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .tint(.pink)
                
                Link("Go to hell.com", destination: URL(string: "https://apple.com")!)
                    .buttonStyle(.plain)
                    .padding()
                    .border(.primary, width: 2)
                
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack(spacing: 12) {
                        Image(systemName: "apple.logo")
                        Text("Apple Store")
                    }
                }
                .font(.callout)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(
                    Capsule()
                        .fill(Color.blue)
                )
                
                
                
                
                
            }
            .padding()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}
