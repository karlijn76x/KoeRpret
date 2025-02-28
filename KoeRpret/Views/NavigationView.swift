import SwiftUI

struct NavigationView: View {
    @State var isNavigatingToKidsMode = false

    var body: some View {
        NavigationStack {
            ZStack {
                BackGroundView()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("Welkom bij KoeRpret!")
                        .font(.custom("PatrickHandSC-Regular", size: 46))
                        .multilineTextAlignment(.center)
                        //.padding(.horizontal, 20)
                    
                    Text("Vind een deelnemende boerderij bij jou in de buurt")
                        .font(.custom("PatrickHandSC-Regular", size: 25))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    Image("MapsView") // hardcoded for now
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 340)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(spacing: 8) {
                        Text("'T Nuenens Zuivelhuisje") // hardcoded for now
                            .font(.custom("PatrickHandSC-Regular", size: 30))
                        
                        Text("🕘 9:00 - 20:00") // hardcoded for now
                            .font(.custom("PatrickHandSC-Regular", size: 20))
                        
                        Text("📍 Prinsenweier 18, 5673 TZ Nuenen") // hardcoded for now
                            .font(.custom("PatrickHandSC-Regular", size: 20))
                        
                        Text("📞 06 25184319") // hardcoded for now
                            .font(.custom("PatrickHandSC-Regular", size: 20))
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    CustomButtonView(text: "Switch to Kids Mode!", width: 350, height: 70, fontSize: 40) {
                        isNavigatingToKidsMode = true
                    }
                    .opacity(0.9)
                    
                    NavigationLink(destination: KidsLockView(), isActive: $isNavigatingToKidsMode) {
                        EmptyView()
                    }
                    .hidden()
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    NavigationView()
}
