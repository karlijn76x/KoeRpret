import SwiftUI

struct StartScreenView: View {
    @State private var isShowingPopUpInfo = false
    @State private var isNavigating = false

    var body: some View {
        NavigationStack{
            ZStack {
                Image("ImageStartBackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                Image("KlaraWave")
                    .resizable()
                    .frame(width: 327, height: 502)
                    .padding()
                    .position(x: 170, y: 410)
                
                Text("KoeRpret")
                    .font(.custom("PatrickHandSC-Regular", size: 70))
                    .foregroundColor(.black)
                    .padding()
                    .position(x: 200, y: 55)
                
                CustomButtonView(text: "Ontdek", width: 210, height: 90, fontSize: 70){
                    isNavigating = true
                }
                .position(x: 200, y: 720)
                .opacity(0.9)
                
                
                NavigationLink(destination: NavigationView(), isActive: $isNavigating) {
                    EmptyView()
                }
                .hidden()
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: { isShowingPopUpInfo.toggle() }) {
                            Image(systemName: "info.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                        }
                        .padding(.trailing, 20)
                    }
                    .padding(.bottom, 20)
                    .position(x:190, y: 10)
                }
                
                if isShowingPopUpInfo {
                    ZStack {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture { isShowingPopUpInfo = false }
                        
                        InformationPopUpView()
                            .frame(width: 350, height: 400)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .overlay(
                                Button(action: { isShowingPopUpInfo = false }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding()
                                },
                                alignment: .topTrailing
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    StartScreenView()
}
