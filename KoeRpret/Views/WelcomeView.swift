import SwiftUI

struct WelcomeView: View {
    @State private var isNavigating = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackGroundView()
                    BackgroundSquare()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    Image("KlaraWave")
                        .resizable()
                        .scaledToFit() // Keeps ratio
                        .frame(width: 427, height: 602)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, alignment: .center) // Always center
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    
                    Text("Goeiemoooh")
                        .font(.custom("PatrickHandSC-Regular", size: 50))
                        .foregroundColor(.black)
                        .padding()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.04)
                    
                    Image("TextCloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 300)
                        .offset(y: geometry.size.height * 0.25)
                    
                    Text("Moee ik ben Klara. Welkom op mijn boerderij!")
                        .font(.custom("PatrickHandSC-Regular", size: 33))
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 300, alignment: .center)
                        .offset(y: geometry.size.height * 0.28)
                    
                    CustomButtonView(text: "Ontdek", width: 210, height: 50, fontSize: 50) {
                        isNavigating = true
                    }
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.955) // Dynamically placed at the bottom
                    
                    NavigationLink(destination: HomeView(), isActive: $isNavigating) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
        } .onAppear {
            AudioManager.shared.playCowSound()
        }
    }
}

#Preview {
    WelcomeView()
}

