import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                BackGroundView()
                BackgroundSquare()
                
                
                Text("Boe-gin de pret 🔐")
                    .font(.custom("PatrickHandSC-Regular", size: 50))
                    .foregroundColor(.black)
                    .padding()
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.04)

                VStack(spacing: 60) {  // The space between the buttons
                    
                    // First button
                    Button(action: {
                        print("Button 1 clicked")
                    }) {
                        Rectangle()
                            .fill(Color(red: 189/255, green: 217/255, blue: 242/255)) // Background color
                            .frame(width: 250, height: 270)  // Increased size for the button
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(red: 174/255, green: 194/255, blue: 159/255), lineWidth: 3) // Border color
                            )
                            .overlay(
                                Text("📷")
                                    .font(.system(size: 130))
                            )
                    }
                    
                    // Second button
                    Button(action: {
                        print("Button 2 clicked")
                    }) {
                        Rectangle()
                            .fill(Color(red: 189/255, green: 217/255, blue: 242/255))
                            .frame(width: 250, height: 270)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(red: 174/255, green: 194/255, blue: 159/255), lineWidth: 3)
                            )
                            .overlay(
                                Text("🏆")
                                    .font(.system(size: 130))
                            )
                    }
                }
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.55) 
            }
        }
    }
}

#Preview {
    HomeView()
}

