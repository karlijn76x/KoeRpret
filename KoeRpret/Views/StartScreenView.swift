//
//  StartScreenView.swift
//  KoeRpret
//
//  Created by Karlijn van den Herik on 21/02/2025.
//

import SwiftUI


struct StartScreenView: View {
    var body: some View {
        ZStack {
            Image("ImageStartBackground")
            Image("KlaraWave")
                .resizable()
                .frame(width: 327, height: 502)
                .padding()
                .position(x: 240, y: 560)
            Text("KoeRPret")
                .font(.system(size: 60, weight: .bold, design: .default))
                .foregroundColor(.black)
                .padding()
                .position(x: 260, y: 165)
        }
    }
}

#Preview {
    StartScreenView()
}
