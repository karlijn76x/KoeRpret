import SwiftUI

struct MiniGameView: View {
    @AppStorage("score") private var score = 0  // Sla de score op in AppStorage
    @State private var isNavigating = false

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackGroundView()
                    BackgroundSquare()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)

                    Image("KlaraHappy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 427, height: 602)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)

                    Text("Mini Game")
                        .font(.custom("PatrickHandSC-Regular", size: 50))
                        .foregroundColor(.black)
                        .padding()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.04)

                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(width: 320, height: 250)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .shadow(radius: 5)

                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color(red: 199/255, green: 223/255, blue: 182/255))
                                .frame(width: 90, height: 40)
                                .rotationEffect(.degrees(-20))

                            Text("Klara")
                                .font(.custom("PatrickHandSC-Regular", size: 25))
                                .bold()
                                .rotationEffect(.degrees(-20))
                        }
                        .offset(x: -30, y: -15)
                    }
                    .offset(y: geometry.size.height * 0.23)

                    Text("Tijd voor actie! Wie als eerst de spijker in de melkfles krijgt wint!")
                        .font(.custom("PatrickHandSC-Regular", size: 33))
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 300, alignment: .center)
                        .offset(y: geometry.size.height * 0.22)

                    // Score spetter-afbeelding
                    Image("CowSpot")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .position(x: geometry.size.width * 0.85, y: geometry.size.height * 0.03)

                    // Score getal
                    Text("\(score)")
                        .font(.custom("PatrickHandSC-Regular", size: 27))
                        .bold()
                        .foregroundColor(.white)
                        .position(x: geometry.size.width * 0.845, y: geometry.size.height * 0.026)

                    NavigationLink(destination: HomeView()) {
                        Text("🏡")
                            .font(.system(size: 60))
                            .padding(10)
                    }
                    .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.03)

                    // "Klaar!" knop verhoogt de score
                    CustomButtonView(text: "Klaar!", width: 170, height: 45, fontSize: 40) {
                        score += 3 // Tel 3 punten op bij elke klik
                        isNavigating = true // Activeer de navigatie
                    }
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.94)

                    NavigationLink(destination: MiniGameDoneView(), isActive: $isNavigating) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
        }
    }
}

#Preview {
    MiniGameView()
}

