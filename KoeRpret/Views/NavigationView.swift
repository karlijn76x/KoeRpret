import SwiftUI

struct NavigationView: View {

   @State var isNavigatingToKidsMode = false

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackGroundView()
                    
                    Text("Welkom bij KoeRpret!")
                        .font(.custom("PatrickHandSC-Regular", size: 60))
                        .multilineTextAlignment(.center)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.07)
                    
                    Text("Vind een deelnemende boerderij bij jou in de buurt")
                        .font(.custom("PatrickHandSC-Regular", size: 25))
                        .multilineTextAlignment(.center)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.23)
                    
                    Image("MapsView") // hardcoded for now
                        .resizable()
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.35)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.46)
                    
                    Text("'T Nuenens Zuivelhuisje") // hardcoded for now
                        .font(.custom("PatrickHandSC-Regular", size: 30))
                        .position(x: geometry.size.width * 0.4, y: geometry.size.height * 0.68)
                    
                    Text("🕘 9:00 - 20:00") // hardcoded for now
                        .font(.custom("PatrickHandSC-Regular", size: 20))
                        .position(x: geometry.size.width * 0.33, y: geometry.size.height * 0.74)
                    
                    Text("📍 Prinsenweier 18, 5673 TZ Nuenen") // hardcoded for now
                        .font(.custom("PatrickHandSC-Regular", size: 20))
                        .position(x: geometry.size.width * 0.51, y: geometry.size.height * 0.78)
                    
                    Text("📞 06 25184319") // hardcoded for now
                        .font(.custom("PatrickHandSC-Regular", size: 20))
                        .position(x: geometry.size.width * 0.34, y: geometry.size.height * 0.82)
                    
                    CustomButtonView(text: "Switch to Kids Mode!", width: 350, height: 70, fontSize: 40) {
                        isNavigatingToKidsMode = true
                    }
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.9)
                    .opacity(0.9)
                    
                    NavigationLink(destination: KidsLockView(), isActive: $isNavigatingToKidsMode) {
                        EmptyView()
                    }
                    .hidden()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationView()
}
