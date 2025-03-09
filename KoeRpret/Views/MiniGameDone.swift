import SwiftUI

struct MiniGameDoneView: View {
    @AppStorage("score") private var score = 0  // Haal de score op uit AppStorage
    @State private var isNavigating = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackGroundView()
                    BackgroundSquare()
                    ConfettiView()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    
                    Image("KlaraHappy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 427, height: 602)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, alignment: .center) // Always center
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    
                    Text("Mini Game")
                        .font(.custom("PatrickHandSC-Regular", size: 50))
                        .foregroundColor(.black)
                        .padding()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.04)
                    
                    // White rectangle
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(width: 320, height: 250)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .shadow(radius: 5)
                        
                        // Green little nameboard
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color(red: 199/255, green: 223/255, blue: 182/255))
                                .frame(width: 90, height: 40)
                                .rotationEffect(.degrees(-20)) // rotatoreffect
                            
                            Text("Klara")
                                .font(.custom("PatrickHandSC-Regular", size: 25))
                                .bold()
                                .rotationEffect(.degrees(-20))
                        }
                        .offset(x: -30, y: -15)
                    }
                    .offset(y: geometry.size.height * 0.23)
                    Text("Jaa? Ohh klaar! Goed gedaan. Nu kunnen we weer verder, moehihi")
                        .font(.custom("PatrickHandSC-Regular", size: 33))
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 300, alignment: .center)
                        .offset(y: geometry.size.height * 0.22)

                    NavigationLink(destination: HomeView()) {
                        Text("🏡")
                            .font(.system(size: 60))
                            .padding(10)
                    }
                    .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.03)
                    
                    Image("CowSpot")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .position(x: geometry.size.width * 0.85, y: geometry.size.height * 0.03)
                    
                    // Score shown in Appstore
                    Text("\(score)")
                        .font(.custom("PatrickHandSC-Regular", size: 27))
                        .bold()
                        .foregroundColor(.white)
                        .position(x: geometry.size.width * 0.845, y: geometry.size.height * 0.026)
                    
                    CustomButtonView(text: "Klaar!", width: 170, height: 45, fontSize: 40) {
                        isNavigating = true
                    }
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.94) // Dynamisch geplaatst onderaan
                    
                    NavigationLink(destination: HomeView(), isActive: $isNavigating) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
        }
    }
}

#Preview {
    MiniGameDoneView()
}

