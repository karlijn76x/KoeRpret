import SwiftUI

struct KidsLockView: View {
    @State private var answer = ""
    @State private var isNavigatingToWelcome = false
    @State private var showAlert = false
    @FocusState private var isAnswerFieldFocused: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                BackGroundView()
                

                VStack(spacing: 2) {
                    Text("PSSsst..")
                        .font(.custom("PatrickHandSC-Regular", size: 50))
                        
                    ZStack {
                        BackgroundSquare()
                            .onTapGesture {
                                isAnswerFieldFocused = false
                            }
                        
                        VStack(spacing: 20) {
                            Image("KlaraHappyIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 165, height: 147)
                            
                            Text("Ouder controle om te vergrendelen")
                                .font(.custom("PatrickHandSC-Regular", size: 27))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                            
                            Text("Hoeveel is 8 x 8?")
                                .font(.custom("PatrickHandSC-Regular", size: 25))
                            
                            TextField("Antwoord", text: $answer)
                                .font(.custom("PatrickHandSC-Regular", size: 30))
                                .padding()
                                .frame(width: 210, height: 50)
                                .background(Color.white)
                                .cornerRadius(8)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .focused($isAnswerFieldFocused)
                            
                            CustomButtonView(text: "Lock!", width: 210, height: 90, fontSize: 70) {
                                checkAnswer()
                            }
                        }
                        .padding(.top, 40)
                        .alert("Fout antwoord", isPresented: $showAlert) {
                            Button("Probeer opnieuw", role: .cancel) { }
                        } message: {
                            Text("Dat is niet correct, probeer het nog eens!")
                        }
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                NavigationLink(destination: WelcomeView(), isActive: $isNavigatingToWelcome) {
                    EmptyView()
                }
                .hidden()
            }
        }
    }

    private func checkAnswer() {
        if answer.trimmingCharacters(in: .whitespacesAndNewlines) == "64" {
            isNavigatingToWelcome = true
        } else {
            showAlert = true
        }
    }
}

#Preview {
    KidsLockView()
}
