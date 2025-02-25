//
//  KidsLockView.swift
//  KoeRpret
//
//  Created by Karlijn van den Herik on 21/02/2025.
//

import SwiftUI

struct KidsLockView: View {
    @State private var isCheckCorrect = false
    @State private var isNavigatingToWelcome = false
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ZStack {
                    BackGroundView()
                    BackgroundSquare()
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    
                    Text("PSSsst..")
                        .font(.custom("PatrickHandSC-Regular", size: 50))
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.02)
                    
                    Image("KlaraHappyIcon")
                        .resizable()
                        .frame(width: 165, height: 147)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.21)
                    
                    CustomButtonView(text: "Lock!", width: 210, height: 90, fontSize: 70) {
                        isNavigatingToWelcome = true
                    }
                    
                    NavigationLink(destination: WelcomeView(), isActive: $isNavigatingToWelcome) {
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
    KidsLockView()
}
