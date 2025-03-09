import SwiftUI

struct HomeView: View {

    @State private var isNavigatingToCamera = false
    @State private var isNavigatingToTrophy = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackGroundView()
                    BackgroundSquare()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
 
                    Text("Boe-gin de pret")
                        .font(.custom("PatrickHandSC-Regular", size: 50))
                        .foregroundColor(.black)
                        .padding()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.04)

                    VStack(spacing: 60) {  // The space between the buttons
                        
                        // First button to navigate to QuizView
                        CustomButtonView(text: "📷", width: 250, height: 270, fontSize: 130) {
                            isNavigatingToCamera = true
                        }
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.3)
                        
                        // Second button to navigate to TrophyView
                        CustomButtonView(text: "🏆", width: 250, height: 270, fontSize: 130) {
                            isNavigatingToTrophy = true
                        }
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.2)
                    }
                    
                    // NavigationLink for the first button (QuizView)
                    NavigationLink(destination: CameraView(), isActive: $isNavigatingToCamera) {
                        EmptyView()
                    }
                    .hidden()
                    
                    // NavigationLink for the second button (TrophyView)
                    NavigationLink(destination: ThrophyView(), isActive: $isNavigatingToTrophy) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

