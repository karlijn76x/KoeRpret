import SwiftUI

struct AnswerPopUpView: View {
    @State private var isNavigating = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackGroundView()
                    BackgroundSquare()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    
                    Image("KlaraFact")
                        .resizable()
                        .scaledToFit() // Keeps ratio
                        .frame(width: 427, height: 602)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, alignment: .center) // Always center
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    
                    
                    Text("💡")
                        .font(.system(size: 90))
                        .offset(x: -160, y: -93)
                    
                    Text("Feitje")
                        .font(.custom("PatrickHandSC-Regular", size: 50))
                        .foregroundColor(.black)
                        .padding()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.04)
                    
                    // witte vlak en het groene naambordje
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(width: 320, height: 260)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1) // Dunne zwarte lijn
                            )
                            .shadow(radius: 5)
                        
                        // Groen naambordje linksboven
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color(red: 199/255, green: 223/255, blue: 182/255))                                .frame(width: 90, height: 40)
                                .rotationEffect(.degrees(-20)) // Schuin zetten
                            
                            Text("Klara")
                                .font(.custom("PatrickHandSC-Regular", size: 25))
                                .bold()
                                .rotationEffect(.degrees(-20))
                        }
                        .offset(x: -30, y: -15)
                    }
                    .offset(y: geometry.size.height * 0.23) // Hele ZStack verplaatsen

                    
                    Text("Wist je dat wij beste vriendinnen hebben en we gestrest raken als we gescheiden worden? Ik kan niet zonder ze!")
                        .font(.custom("PatrickHandSC-Regular", size: 30))
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 300, alignment: .center)
                        .offset(y: geometry.size.height * 0.22)
                    
                    // Home-emoji knop linksboven
                    NavigationLink(destination: HomeView()) {
                        Text("🏡")
                            .font(.system(size: 60))
                            .padding(10)
                    }
                    .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.03)

                    
                    CustomButtonView(text: "Verder", width: 170, height: 45, fontSize: 40) {
                        isNavigating = true
                    }
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.94) // Dynamically placed at the bottom
                    
                    NavigationLink(destination: MiniGameView(), isActive: $isNavigating) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
        }
    }
}

#Preview {
    AnswerPopUpView()
}

