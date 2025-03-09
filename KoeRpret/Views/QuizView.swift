import SwiftUI

struct QuizView: View {
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isCorrectAnswer = false
    @State private var isNavigating = false
    @AppStorage("score") private var score = 0  // Score opslaan en ophalen

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackGroundView()
                    BackgroundSquare()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)

                    Text("Mini-game")
                        .font(.custom("PatrickHandSC-Regular", size: 50))
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.04)

                    Image("KlaraHappyIcon")
                        .resizable()
                        .frame(width: 165, height: 147)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.21)

                    Text("Wat drinkt een koe?")
                        .font(.custom("PatrickHandSC-Regular", size: 36))
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.35)

                    
                    Image("MilkImage")
                        .resizable()
                        .frame(width: 270, height: 147)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                        .onTapGesture {
                            alertMessage = "Jammer, fout!"
                            showAlert = true
                            isCorrectAnswer = false
                        }

                    
                    Image("WaterImage")
                        .resizable()
                        .frame(width: 270, height: 147)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.75)
                        .onTapGesture {
                            alertMessage = "Helemaal goed!"
                            showAlert = true
                            isCorrectAnswer = true
                            score += 1
                        }

                    
                    Image("CowSpot")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .position(x: geometry.size.width * 0.85, y: geometry.size.height * 0.03)

                    Text("\(score)")
                        .font(.custom("PatrickHandSC-Regular", size: 25))
                        .bold()
                        .foregroundColor(.white)
                        .position(x: geometry.size.width * 0.85, y: geometry.size.height * 0.026)

                    // Feitje knop (alleen bij goed antwoord)
                    if isCorrectAnswer {
                        CustomButtonView(text: "Feitje", width: 210, height: 50, fontSize: 50) {
                            isNavigating = true
                        }
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.93)
                    }
                }
                .alert(alertMessage, isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                
                NavigationLink(destination: AnswerPopUpView(), isActive: $isNavigating) {
                    EmptyView()
                }
                .hidden()
            }
        }
    }
}

#Preview {
    QuizView()
}

