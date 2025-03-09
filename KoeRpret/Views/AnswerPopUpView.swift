import SwiftUI

struct AnswerPopUpView: View {
    @State private var isNavigating = false
    @State private var isAnimating = false
    @State private var isBlinking = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackGroundView()
                    BackgroundSquare()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    
                    Image("KlaraFact")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 427, height: 602)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    

                    //With Animation
                    Text("💡")
                        .font(.system(size: 95))
                        .opacity(isBlinking ? 0 : 1.0)
                        .position(x: geometry.size.width * 0.11, y: geometry.size.height * 0.38)
                        .animation(
                            Animation.easeInOut(duration: 0.6)
                                .repeatForever(autoreverses: true),
                            value: isBlinking
                        )
                        .onAppear {
                            isBlinking = true
                        }

                    
                    Text("Feitje")
                        .font(.custom("PatrickHandSC-Regular", size: 50))
                        .foregroundColor(.black)
                        .padding()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.04)
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(width: 320, height: 260)
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
                    
                    Text("Wist je dat wij beste vriendinnen hebben en we gestrest raken als we gescheiden worden? Ik kan niet zonder ze!")
                        .font(.custom("PatrickHandSC-Regular", size: 30))
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

                    CustomButtonView(text: "Verder", width: 170, height: 45, fontSize: 40) {
                        isNavigating = true
                    }
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.94)
                    
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
    AnswerPopUpView()
}

