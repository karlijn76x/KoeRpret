import SwiftUI

struct ThrophyView: View {
    @AppStorage("score") private var score = 0  // Haal de score op uit AppStorage
    @State private var isNavigating = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackGroundView()
                    BackgroundSquare()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.55)
                    
                    Text("Boe-nuspunten")
                        .font(.custom("PatrickHandSC-Regular", size: 45))
                        .foregroundColor(.black)
                        .padding()
                        .position(x: geometry.size.width * 0.52, y: geometry.size.height * 0.04)
                    
                    Image("KlaraHappyIcon")
                        .resizable()
                        .frame(width: 165, height: 147)
                        .position(x: geometry.size.width * 0.28, y: geometry.size.height * 0.21)
                    
                    Text("Moeee, \nvind hier je score!")
                        .font(.custom("PatrickHandSC-Regular", size: 27))
                        .foregroundColor(.black)
                        .padding()
                        .position(x: geometry.size.width * 0.68, y: geometry.size.height * 0.2)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 199/255, green: 223/255, blue: 182/255))
                        .frame(width: 320, height: 440)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 3)
                        )
                        .shadow(radius: 5)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.6)
                    
                    Text("Totaal Score:")
                        .font(.custom("PatrickHandSC-Regular", size: 40))
                        .foregroundColor(.black)
                        .padding()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.4)
                    
                    Text("pss..Bij 20 punten mag je \neen prijs ophalen in de winkel")
                        .font(.custom("PatrickHandSC-Regular", size: 24))
                        .foregroundColor(.black)
                        .padding()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.83)

                    Image("CowSpot")
                        .resizable()
                        .frame(width: 275, height: 300)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.65)
                    
                    // Voeg de score toe boven de CowSpot afbeelding, wit en goed gepositioneerd
                    Text("\(score)")
                        .font(.custom("PatrickHandSC-Regular", size: 70))
                        .bold()
                        .foregroundColor(.white) // Wit
                        .position(x: geometry.size.width * 0.485, y: geometry.size.height * 0.63)

                    // Home-emoji knop linksboven
                    NavigationLink(destination: HomeView()) {
                        Text("🏡")
                            .font(.system(size: 60))
                            .padding(10)
                    }
                    .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.03)

                }
            }
        }
    }
}

#Preview {
    ThrophyView()
}

