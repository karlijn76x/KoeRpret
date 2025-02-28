import SwiftUI

struct HomeView: View {
    @State private var isNavigatingToCamera = false
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ZStack {
                    BackGroundView()
                    BackgroundSquare()
                    
                    
                    Text("Boe-gin de pret 🔐")
                        .font(.custom("PatrickHandSC-Regular", size: 50))
                        .foregroundColor(.black)
                        .padding()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.04)
                    
                    VStack(spacing: 60) {
                
                        Button(action: {
                            isNavigatingToCamera = true
                            print("Button 1 clicked")
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
                                    Text("📷")
                                        .font(.system(size: 130))
                                )
                        }
                        
                        NavigationLink(destination: CameraView(), isActive: $isNavigatingToCamera) {
                            EmptyView()
                        }
                        .hidden()
                        
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
}

#Preview {
    HomeView()
}

